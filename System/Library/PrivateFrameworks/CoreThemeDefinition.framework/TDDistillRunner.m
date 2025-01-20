@interface TDDistillRunner
- (BOOL)_isDistillUnnecessaryForDocument:(id)a3;
- (BOOL)packImagesInDocument;
- (BOOL)runDistillWithDocumentURL:(id)a3 outputURL:(id)a4 attemptIncremental:(BOOL)a5 forceDistill:(BOOL)a6;
- (NSString)assetStoreVersionString;
- (NSString)minDeploymentTarget;
- (NSURL)outputURL;
- (TDDistillRunner)init;
- (TDLogger)logger;
- (id)carScratchURL;
- (int64_t)assetStoreVersionNumber;
- (void)_moveScratchToOutputPath;
- (void)_removeScratchPath;
- (void)dealloc;
- (void)setAssetStoreVersionNumber:(int64_t)a3;
- (void)setAssetStoreVersionString:(id)a3;
- (void)setLogger:(id)a3;
- (void)setMinDeploymentTarget:(id)a3;
- (void)setOutputURL:(id)a3;
- (void)setPackImagesInDocument:(BOOL)a3;
@end

@implementation TDDistillRunner

- (TDDistillRunner)init
{
  v3.receiver = self;
  v3.super_class = (Class)TDDistillRunner;
  result = [(TDDistillRunner *)&v3 init];
  if (result) {
    result->_assetStoreVersionNumber = 17;
  }
  return result;
}

- (id)carScratchURL
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id result = self->_carScratchURL;
  if (!result)
  {
    [[(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:@"CoreThemeThemeDistillXXXXXX.car"] getFileSystemRepresentation:__s maxLength:1024];
    int v4 = mkstemps(__s, 4);
    size_t v5 = strlen(__s);
    self->_carScratchURL = (NSURL *)CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)__s, v5, 0);
    v6 = (void *)[MEMORY[0x263F08850] defaultManager];
    v7 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", objc_msgSend(v6, "attributesOfItemAtPath:error:", -[NSURL path](self->_carScratchURL, "path"), 0));
    uint64_t v8 = [NSNumber numberWithInteger:420];
    [v7 setObject:v8 forKey:*MEMORY[0x263F08078]];
    objc_msgSend(v6, "setAttributes:ofItemAtPath:error:", v7, -[NSURL path](self->_carScratchURL, "path"), 0);
    close(v4);
    return self->_carScratchURL;
  }
  return result;
}

- (void)_removeScratchPath
{
  id v2 = [(TDDistillRunner *)self carScratchURL];
  if ([v2 checkResourceIsReachableAndReturnError:0])
  {
    objc_super v3 = (void *)[MEMORY[0x263F08850] defaultManager];
    [v3 removeItemAtURL:v2 error:0];
  }
}

- (void)_moveScratchToOutputPath
{
  id v4 = [(TDDistillRunner *)self carScratchURL];
  size_t v5 = (void *)[MEMORY[0x263F08850] defaultManager];
  if (([v4 checkResourceIsReachableAndReturnError:0] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TDDistillRunner.m", 79, @"-[TPDistillerController _moveScratchToOutputPath] called with no file at %@", objc_msgSend(v4, "path"));
  }
  v6 = [(TDDistillRunner *)self outputURL];
  if ([(NSURL *)v6 checkResourceIsReachableAndReturnError:0]) {
    [v5 removeItemAtURL:v6 error:0];
  }
  uint64_t v10 = 0;
  if (([v5 moveItemAtURL:v4 toURL:v6 error:&v10] & 1) == 0)
  {
    v7 = [(TDDistillRunner *)self logger];
    uint64_t v8 = [v4 path];
    uint64_t v9 = [(NSURL *)v6 path];
    [(TDLogger *)v7 logErrorWithFormat:@"move from %@ toPath: %@ failed: %@", v8, v9, v10];
  }
}

- (BOOL)_isDistillUnnecessaryForDocument:(id)a3
{
  id v4 = [(TDDistillRunner *)self outputURL];
  if ([(NSURL *)v4 checkResourceIsReachableAndReturnError:0])
  {
    size_t v5 = [[TDProMergeableCommonAssetStorage alloc] initWithPath:[(NSURL *)v4 path]];
    int v6 = [a3 checksum];
    if (v5 && v6 == [(CUICommonAssetStorage *)v5 associatedChecksum])
    {
      v7 = (void *)[a3 historian];
      int v8 = objc_msgSend(v7, "foundDataChangesSinceDate:", objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)-[CUICommonAssetStorage storageTimestamp](v5, "storageTimestamp"))) ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)packImagesInDocument
{
  return self->_packDocument;
}

- (void)setPackImagesInDocument:(BOOL)a3
{
  self->_packDocument = a3;
}

- (BOOL)runDistillWithDocumentURL:(id)a3 outputURL:(id)a4 attemptIncremental:(BOOL)a5 forceDistill:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v36 = *MEMORY[0x263EF8340];
  v33 = 0;
  id v34 = 0;
  uint64_t v11 = [a3 pathExtension];
  uint64_t v32 = 0;
  [(TDDistillRunner *)self setOutputURL:a4];
  [[(NSString *)NSTemporaryDirectory() stringByAppendingPathComponent:@"CoreThemeDefinitionMigrationXXXXXX"] getFileSystemRepresentation:to maxLength:1024];
  mktemp(to);
  v12 = copyfile_state_alloc();
  int v13 = copyfile((const char *)[a3 fileSystemRepresentation], to, v12, 0x1000000u);
  copyfile_state_free(v12);
  v14 = [(TDDistillRunner *)self logger];
  uint64_t v15 = [a3 fileSystemRepresentation];
  if (v13 < 0)
  {
    [(TDLogger *)v14 logErrorWithFormat:@"Unable to copy '%s' to '%s' distil failed.", v15, to];
    return 0;
  }
  [(TDLogger *)v14 logInfoWithFormat:@"Distiling document '%s' to '%s.", v15, to];
  id v16 = (id)[objc_alloc(NSURL) initFileURLWithFileSystemRepresentation:to isDirectory:0 relativeToURL:0];
  v17 = [[CoreThemeDocument alloc] initWithContentsOfURL:v16 ofType:v11 error:&v34];
  -[CoreThemeDocument setPathToRepresentedDocument:](v17, "setPathToRepresentedDocument:", [a3 path]);
  if (v17)
  {
    [(CoreThemeDocument *)v17 setMinimumDeploymentVersion:[(TDDistillRunner *)self minDeploymentTarget]];
    if (![(TDDistillRunner *)self packImagesInDocument]) {
      goto LABEL_17;
    }
    [(CoreThemeDocument *)v17 packRenditionsError:&v33];
    objc_msgSend(-[TDPersistentDocument managedObjectContext](v17, "managedObjectContext"), "save:", &v34);
    if (v34) {
      goto LABEL_17;
    }
    v18 = v33;
    if (!v33) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (-[__CFString isEqualToString:](CoreThemeDefinitionErrorDomain[0], "isEqualToString:", [v34 domain])&& objc_msgSend(v34, "code") == 101)
  {
    uint64_t v32 = 0;
    id v16 = +[CoreThemeDocument migrateDocumentAtURL:v16 ofType:v11 error:&v32];
    id v19 = v16;
    if (v16)
    {
      v17 = [[CoreThemeDocument alloc] initWithContentsOfURL:v16 ofType:v11 error:&v32];
      if (v17)
      {
        -[CoreThemeDocument setPathToRepresentedDocument:](v17, "setPathToRepresentedDocument:", [a3 path]);
        [(CoreThemeDocument *)v17 setMinimumDeploymentVersion:[(TDDistillRunner *)self minDeploymentTarget]];
        if ([(TDDistillRunner *)self packImagesInDocument])
        {
          [(CoreThemeDocument *)v17 packRenditionsError:&v33];
          objc_msgSend(-[TDPersistentDocument managedObjectContext](v17, "managedObjectContext"), "save:", &v34);
        }
      }
      v18 = v33;
LABEL_15:
      id v34 = v18;
      goto LABEL_17;
    }
    v17 = 0;
  }
  else
  {
    v17 = 0;
    id v34 = 0;
  }
LABEL_17:
  v20 = v17;
  id v21 = v34;
  if (!v17 || v34)
  {
    if (!v17)
    {
      -[TDLogger logErrorWithFormat:](-[TDDistillRunner logger](self, "logger"), "logErrorWithFormat:", @"Unable to open theme definition file %@.", [a3 path]);
      id v21 = v34;
    }
    if (v21)
    {
      v23 = [(TDDistillRunner *)self logger];
      -[TDLogger logErrorWithFormat:](v23, "logErrorWithFormat:", @"Error: %@\n", [v34 localizedDescription]);
      v24 = (void *)[v34 userInfo];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __87__TDDistillRunner_runDistillWithDocumentURL_outputURL_attemptIncremental_forceDistill___block_invoke;
      v31[3] = &unk_264C44F30;
      v31[4] = self;
      [v24 enumerateKeysAndObjectsUsingBlock:v31];
    }
  }
  else
  {
    +[CoreThemeDocument _addThemeDocument:v17];
    if (!a6 && [(TDDistillRunner *)self _isDistillUnnecessaryForDocument:v17])
    {
      [(TDLogger *)[(TDDistillRunner *)self logger] logInfoWithFormat:@"No changes to distill."];

      return 1;
    }
    id v25 = [(TDDistillRunner *)self carScratchURL];
    v26 = v25;
    if (v7) {
      id v25 = a4;
    }
    uint64_t v27 = [v25 path];

    self->_distiller = 0;
    v28 = [[TDDistiller alloc] initWithDocument:v17 outputPath:v27 attemptIncremental:v7];
    self->_distiller = v28;
    if (!v28 && v7)
    {
      v28 = -[TDDistiller initWithDocument:outputPath:attemptIncremental:]([TDDistiller alloc], "initWithDocument:outputPath:attemptIncremental:", v17, [v26 path], 0);
      self->_distiller = v28;
    }
    if (v28)
    {
      [(TDDistiller *)v28 setDontPackRenditionsBeforeDistilling:1];
      [(TDDistiller *)self->_distiller setAssetStoreVersionNumber:[(TDDistillRunner *)self assetStoreVersionNumber]];
      [(TDDistiller *)self->_distiller setAssetStoreVersionString:[(TDDistillRunner *)self assetStoreVersionString]];
      [(TDDistiller *)self->_distiller setLogger:[(TDDistillRunner *)self logger]];
      distiller = self->_distiller;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __87__TDDistillRunner_runDistillWithDocumentURL_outputURL_attemptIncremental_forceDistill___block_invoke_2;
      v30[3] = &unk_264C44F58;
      v30[4] = self;
      v30[5] = a3;
      v30[6] = v16;
      v30[7] = v17;
      [(TDDistiller *)distiller saveAndDistillWithCompletionHandler:v30];
      [(TDDistiller *)self->_distiller waitUntilFinished];

      return [(TDDistiller *)self->_distiller isSuccessful];
    }
    [(TDLogger *)[(TDDistillRunner *)self logger] logErrorWithFormat:@"Error:  Aborting distillation"];
  }

  return 0;
}

uint64_t __87__TDDistillRunner_runDistillWithDocumentURL_outputURL_attemptIncremental_forceDistill___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "logger"), "logErrorWithFormat:", @"%@ = %@", a2, a3);
}

uint64_t __87__TDDistillRunner_runDistillWithDocumentURL_outputURL_attemptIncremental_forceDistill___block_invoke_2(id *a1, int a2, void *a3)
{
  char v6 = [*((id *)a1[4] + 2) isIncremental];
  if (a2)
  {
    if ((v6 & 1) == 0) {
      [a1[4] _moveScratchToOutputPath];
    }
  }
  else
  {
    if ((v6 & 1) == 0) {
      [a1[4] _removeScratchPath];
    }
    objc_msgSend((id)objc_msgSend(a1[4], "logger"), "logErrorWithFormat:", @"Failed to distill document '%@'", objc_msgSend(a1[5], "path"));
    objc_msgSend((id)objc_msgSend(a1[4], "logger"), "logError:", objc_msgSend(a3, "localizedDescription"));
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(a1[6], "lastPathComponent"), "hasPrefix:", @"CoreThemeDefinitionMigration");
  if (result)
  {
    id v12 = 0;
    [a1[7] close];

    int v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtURL:error:", a1[6], &v12);
    uint64_t v9 = (void *)[a1[4] logger];
    uint64_t v10 = [a1[6] path];
    if (v8)
    {
      return [v9 logInfoWithFormat:@"Removed temporary migration file at path: %@", v10];
    }
    else
    {
      [v9 logErrorWithFormat:@"Failed to remove temporary migration file at path: %@", v10];
      uint64_t v11 = (void *)[a1[4] logger];
      return objc_msgSend(v11, "logError:", objc_msgSend(v12, "localizedDescription"));
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TDDistillRunner;
  [(TDDistillRunner *)&v3 dealloc];
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
}

- (TDLogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (NSString)assetStoreVersionString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAssetStoreVersionString:(id)a3
{
}

- (int64_t)assetStoreVersionNumber
{
  return self->_assetStoreVersionNumber;
}

- (void)setAssetStoreVersionNumber:(int64_t)a3
{
  self->_assetStoreVersionNumber = a3;
}

- (NSString)minDeploymentTarget
{
  return self->_minDeploymentTarget;
}

- (void)setMinDeploymentTarget:(id)a3
{
  self->_minDeploymentTarget = (NSString *)a3;
}

@end