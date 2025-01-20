@interface HDOntologyMercuryZipTSVAttributeLineImporter
+ (BOOL)importLineWithScanner:(id)a3 slot:(int64_t)a4 graphDatabase:(id)a5 context:(id *)a6 error:(id *)a7;
+ (BOOL)isHeaderLine:(id)a3;
@end

@implementation HDOntologyMercuryZipTSVAttributeLineImporter

+ (BOOL)isHeaderLine:(id)a3
{
  return [a3 hasPrefix:@"source_id"];
}

+ (BOOL)importLineWithScanner:(id)a3 slot:(int64_t)a4 graphDatabase:(id)a5 context:(id *)a6 error:(id *)a7
{
  char v10 = a4;
  id v11 = a3;
  id v12 = a5;
  uint64_t v50 = -1;
  if ([v11 scanLongLong:&v50])
  {
    uint64_t v49 = -1;
    if ([v11 scanLongLong:&v49])
    {
      id v48 = 0;
      char v13 = [v11 scanString:&v48];
      id v14 = v48;
      if (v13)
      {
        uint64_t v47 = 0;
        if ([v11 scanLongLong:&v47])
        {
          int64_t v16 = v49;
          int64_t v15 = v50;
          uint64_t v45 = v47;
          id v17 = v14;
          id v46 = v12;
          self;
          self;
          if (a6->var0 == v15 && a6->var0 != -1 && a6->var1 == v16) {
            goto LABEL_23;
          }
          id v44 = v17;
          a6->int64_t var0 = v15;
          a6->int64_t var1 = v16;
          a6->var3 = 1;
          a6->var2 = 1 << v10;
          id v18 = v46;
          self;
          uint64_t v51 = 0;
          uint64_t v52 = 0;
          int64_t var0 = a6->var0;
          int64_t var1 = a6->var1;
          id v21 = v18;
          self;
          v22 = [v21 underlyingDatabase];

          int64_t v23 = +[HDSimpleGraphDatabaseAttributeEntity maxVersion:&v52 slots:&v51 nodeID:var0 type:var1 database:v22 error:a7];
          if (!v23) {
            goto LABEL_25;
          }
          if (v23 == 1)
          {
            uint64_t v24 = v51;
            uint64_t v25 = v52;
            id v26 = v21;
            self;
            int64_t v27 = a6->var0;
            int64_t v28 = a6->var1;
            unint64_t v29 = a6->var2 | v24;
            a6->var2 = v29;
            a6->var3 = v25 < v45;
            if (v25 < v45)
            {
              int64_t v30 = v27;
              int64_t v31 = v28;
              v32 = [v26 underlyingDatabase];
              BOOL v33 = +[HDSimpleGraphDatabaseAttributeEntity deleteAttributesWithNodeID:v30 type:v31 database:v32 error:a7];
              goto LABEL_21;
            }
            if (v29 != v24)
            {
              int64_t v43 = v28;
              int64_t v39 = v27;
              v32 = [v26 underlyingDatabase];
              BOOL v33 = +[HDSimpleGraphDatabaseAttributeEntity updateSlots:v29 nodeID:v39 type:v43 database:v32 error:a7];
LABEL_21:
              BOOL v40 = v33;

              if (v40) {
                goto LABEL_22;
              }
LABEL_25:
              char v36 = 0;
              id v17 = v44;
              goto LABEL_26;
            }
          }
LABEL_22:

          id v17 = v44;
LABEL_23:
          if (!a6->var3)
          {
            char v36 = 1;
            goto LABEL_28;
          }
          id v41 = v46;
          id v21 = v17;
          self;
          char v36 = [v41 addAttributeForNodeID:a6->var0 type:a6->var1 value:v21 version:v45 slots:a6->var2 error:a7];

LABEL_26:
LABEL_28:

          goto LABEL_29;
        }
        v37 = (void *)MEMORY[0x1E4F28C58];
        v38 = @"Error parsing int64_t into version";
      }
      else
      {
        v37 = (void *)MEMORY[0x1E4F28C58];
        v38 = @"Error parsing string into attributeValue";
      }
      objc_msgSend(v37, "hk_assignError:code:description:", a7, 129, v38);
      char v36 = 0;
LABEL_29:

      goto LABEL_30;
    }
    v34 = (void *)MEMORY[0x1E4F28C58];
    v35 = @"Error parsing int64_t into attributeType";
  }
  else
  {
    v34 = (void *)MEMORY[0x1E4F28C58];
    v35 = @"Error parsing int64_t into nodeID";
  }
  objc_msgSend(v34, "hk_assignError:code:description:", a7, 129, v35);
  char v36 = 0;
LABEL_30:

  return v36;
}

@end