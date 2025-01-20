@interface HDOntologyMercuryZipTSVRelationshipLineImporter
+ (BOOL)importLineWithScanner:(id)a3 slot:(int64_t)a4 graphDatabase:(id)a5 context:(id *)a6 error:(id *)a7;
+ (BOOL)isHeaderLine:(id)a3;
@end

@implementation HDOntologyMercuryZipTSVRelationshipLineImporter

+ (BOOL)isHeaderLine:(id)a3
{
  return [a3 hasPrefix:@"source_id"];
}

+ (BOOL)importLineWithScanner:(id)a3 slot:(int64_t)a4 graphDatabase:(id)a5 context:(id *)a6 error:(id *)a7
{
  char v10 = a4;
  id v11 = a3;
  id v12 = a5;
  uint64_t v45 = -1;
  if (([v11 scanLongLong:&v45] & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1E4F28C58];
    v33 = @"Error parsing int64_t into subjectID";
LABEL_15:
    objc_msgSend(v32, "hk_assignError:code:format:", a7, 129, v33);
    goto LABEL_16;
  }
  uint64_t v44 = -1;
  if (([v11 scanLongLong:&v44] & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1E4F28C58];
    v33 = @"Error parsing int64_t into relationshipType";
    goto LABEL_15;
  }
  uint64_t v43 = -1;
  if (([v11 scanLongLong:&v43] & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1E4F28C58];
    v33 = @"Error parsing int64_t into objectID";
    goto LABEL_15;
  }
  uint64_t v42 = 0;
  if ([v11 scanLongLong:&v42])
  {
    int64_t v14 = v44;
    int64_t v13 = v45;
    uint64_t v15 = v43;
    uint64_t v41 = v42;
    id v16 = v12;
    self;
    self;
    if (a6->var0 == v13 && a6->var0 != -1 && a6->var1 == v14) {
      goto LABEL_24;
    }
    uint64_t v39 = v15;
    id v40 = v16;
    a6->int64_t var0 = v13;
    a6->int64_t var1 = v14;
    a6->var3 = 1;
    a6->var2 = 1 << v10;
    id v17 = v16;
    self;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    int64_t var0 = a6->var0;
    int64_t var1 = a6->var1;
    id v20 = v17;
    self;
    v21 = [v20 underlyingDatabase];

    int64_t v22 = +[HDSimpleGraphDatabaseRelationshipEntity maxVersion:&v47 slots:&v46 subjectNodeID:var0 relationshipID:var1 database:v21 error:a7];
    if (!v22) {
      goto LABEL_26;
    }
    if (v22 == 1)
    {
      uint64_t v23 = v46;
      uint64_t v24 = v47;
      id v25 = v20;
      self;
      int64_t v27 = a6->var0;
      int64_t v26 = a6->var1;
      unint64_t v28 = a6->var2 | v23;
      a6->var2 = v28;
      a6->var3 = v24 < v41;
      if (v24 < v41)
      {
        int64_t v29 = v26;
        v30 = [v25 underlyingDatabase];
        BOOL v31 = +[HDSimpleGraphDatabaseRelationshipEntity deleteRelationshipsWithSubjectID:v27 relationshipID:v29 database:v30 error:a7];
        goto LABEL_22;
      }
      if (v28 != v23)
      {
        int64_t v38 = v26;
        v30 = [v25 underlyingDatabase];
        BOOL v31 = +[HDSimpleGraphDatabaseRelationshipEntity updateSlots:v28 subjectNodeID:v27 relationshipID:v38 database:v30 error:a7];
LABEL_22:
        BOOL v36 = v31;

        if (v36) {
          goto LABEL_23;
        }
LABEL_26:
        char v34 = 0;
        id v16 = v40;
        goto LABEL_27;
      }
    }
LABEL_23:

    uint64_t v15 = v39;
    id v16 = v40;
LABEL_24:
    if (!a6->var3)
    {
      char v34 = 1;
      goto LABEL_29;
    }
    id v37 = v16;
    self;
    char v34 = [v37 addRelationshipWithSubjectNodeID:a6->var0 type:a6->var1 objectNodeID:v15 version:v41 slots:a6->var2 error:a7];
LABEL_27:

LABEL_29:
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a7, 129, @"Error parsing int64_t into version");
LABEL_16:
  char v34 = 0;
LABEL_17:

  return v34;
}

@end