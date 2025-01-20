@interface HDOntologyMercuryZipTSVNodeLineImporter
+ (BOOL)importLineWithScanner:(id)a3 slot:(int64_t)a4 graphDatabase:(id)a5 context:(id *)a6 error:(id *)a7;
+ (BOOL)isHeaderLine:(id)a3;
@end

@implementation HDOntologyMercuryZipTSVNodeLineImporter

+ (BOOL)isHeaderLine:(id)a3
{
  return [a3 hasPrefix:@"hg_id"];
}

+ (BOOL)importLineWithScanner:(id)a3 slot:(int64_t)a4 graphDatabase:(id)a5 context:(id *)a6 error:(id *)a7
{
  char v9 = a4;
  id v10 = a3;
  id v11 = a5;
  uint64_t v40 = -1;
  if ([v10 scanLongLong:&v40])
  {
    uint64_t v39 = 0;
    if ([v10 scanLongLong:&v39])
    {
      uint64_t v38 = 0;
      if ([v10 scanLongLong:&v38])
      {
        uint64_t v12 = v39;
        uint64_t v13 = v40;
        uint64_t v37 = v38;
        unsigned int v36 = v38 != 0;
        id v14 = v11;
        self;
        id v15 = v14;
        self;
        id v41 = 0;
        v16 = [v15 nodeForID:v13 error:&v41];

        id v17 = v41;
        v18 = v17;
        if (v16)
        {
          id v19 = v16;
        }
        else if (v17)
        {
          if (a7) {
            *a7 = v17;
          }
          else {
            _HKLogDroppedError();
          }

          LOBYTE(a7) = 0;
          goto LABEL_32;
        }

        id v20 = v16;
        if (!v16)
        {
          LOBYTE(a7) = [v15 insertNodeWithID:v13 version:v12 slots:1 << v9 deleted:v37 != 0 error:a7];
LABEL_32:

          goto LABEL_14;
        }
        id v21 = v20;
        id v22 = v15;
        self;
        uint64_t v35 = [v21 rowID];
        uint64_t v23 = [v21 version];
        uint64_t v24 = [v21 slots];
        uint64_t v25 = v24 | (1 << v9);
        if (v23 < v12 || v25 != v24)
        {
          uint64_t v33 = v12;
          if (v23 >= v12)
          {
            uint64_t v12 = [v21 version];
            unsigned int v36 = [v21 isDeleted];
          }
          v34 = v22;
          v29 = [v22 underlyingDatabase];
          BOOL v30 = +[HDSimpleGraphDatabaseNodeEntity updateNodeWithID:v35 version:v12 slots:v25 deleted:v36 database:v29 error:a7];

          if (!v30)
          {
            LOBYTE(a7) = 0;
            id v22 = v34;
            goto LABEL_31;
          }
          id v22 = v34;
          if (v37 && v23 < v33)
          {
            id v31 = v34;
            self;
            v32 = [v31 underlyingDatabase];

            if (!+[HDSimpleGraphDatabaseAttributeEntity deleteAttributesWithNodeID:v35 lessThanVersion:v33 database:v32 error:a7])
            {

              LOBYTE(a7) = 0;
              goto LABEL_31;
            }
            LODWORD(a7) = +[HDSimpleGraphDatabaseRelationshipEntity deleteRelationshipsWithSubjectID:v35 lessThanVersion:v33 database:v32 error:a7];

            if (!a7) {
              goto LABEL_31;
            }
          }
        }
        LOBYTE(a7) = 1;
LABEL_31:

        goto LABEL_32;
      }
      v26 = (void *)MEMORY[0x1E4F28C58];
      v27 = @"Error parsing int64_t into deleted";
    }
    else
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      v27 = @"Error parsing int64_t into version";
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1E4F28C58];
    v27 = @"Error parsing int64_t into rowID";
  }
  objc_msgSend(v26, "hk_assignError:code:format:", a7, 129, v27);
  LOBYTE(a7) = 0;
LABEL_14:

  return (char)a7;
}

@end