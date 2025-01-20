@interface FIICloudDrive
+ (pair<FINode)findUnderlyingNodes;
- (FIICloudDrive)init;
- (FINode)_documents;
- (FINode)_libraries;
- (id)fileURL;
- (id)propertyAsNSObject:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (void)set_documents:(id)a3;
- (void)set_libraries:(id)a3;
@end

@implementation FIICloudDrive

- (FIICloudDrive)init
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_class();
  if (v3)
  {
    [v3 findUnderlyingNodes];
  }
  else
  {
    id v9 = 0;
    id v10 = 0;
  }
  v4 = [(FIICloudDrive *)self _libraries];
  if (v4)
  {
    [(FIICloudDrive *)self _documents];
  }
  v11[0] = v9;
  v11[1] = v10;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v8.receiver = self;
  v8.super_class = (Class)FIICloudDrive;
  v6 = [(FICompoundNode *)&v8 initWithFINodes:v5];

  [(FIICloudDrive *)v6 set_libraries:v9];
  [(FIICloudDrive *)v6 set_documents:v10];

  return v6;
}

+ (pair<FINode)findUnderlyingNodes
{
  v3 = v2;
  uint64_t v4 = +[FINode iCloudLibrariesContainer];
  v5 = +[FINode iCloudDefaultContainer];
  uint64_t *v3 = v4;
  v3[1] = (uint64_t)v5;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (id)fileURL
{
  v2 = [(FIICloudDrive *)self _documents];
  v3 = [v2 fileURL];

  return v3;
}

- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  if (a3 == 1885895027 || a3 == 1819240307)
  {
    v11 = [(FIICloudDrive *)self _documents];
    v12 = [v11 fileParent];

    v13 = [v12 propertyAsNumber:v9 async:v8 options:v7 error:a6];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)FIICloudDrive;
    v13 = [(FICustomNode *)&v15 propertyAsNumber:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
  }
  return v13;
}

- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  v6 = @"🆕 iCloud Drive";
  if ((int)a3 <= 1802072171)
  {
    if (a3 == 1684955501) {
      goto LABEL_11;
    }
    unsigned __int16 v7 = 28260;
  }
  else
  {
    if (a3 == 1970563428)
    {
      BOOL v8 = [(FINode *)self contentType];
      v6 = [v8 identifier];

      goto LABEL_11;
    }
    if (a3 == 1886282093) {
      goto LABEL_11;
    }
    unsigned __int16 v7 = 28780;
  }
  if (a3 == (v7 | 0x6B690000))
  {
    v6 = @"Folder";
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)FIICloudDrive;
    v6 = [(FIDSNode *)&v10 propertyAsString:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
  }
LABEL_11:
  return v6;
}

- (id)propertyAsNSObject:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  if (a3 == 1970566256)
  {
    id v6 = (id)*MEMORY[0x1E4F443C8];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)FIICloudDrive;
    id v6 = [(FIDSNode *)&v8 propertyAsNSObject:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
  }
  return v6;
}

- (FINode)_libraries
{
  return (FINode *)objc_getProperty(self, a2, 152, 1);
}

- (void)set_libraries:(id)a3
{
}

- (FINode)_documents
{
  return (FINode *)objc_getProperty(self, a2, 160, 1);
}

- (void)set_documents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__documents, 0);
  objc_storeStrong((id *)&self->__libraries, 0);
}

@end