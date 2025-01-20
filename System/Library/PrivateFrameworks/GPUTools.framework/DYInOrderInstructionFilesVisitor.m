@interface DYInOrderInstructionFilesVisitor
- (BOOL)_openFilenames:(id)a3 store:(id)a4 filesArray:(id)a5;
- (BOOL)_openFiles:(id)a3;
- (BOOL)unsorted;
- (BOOL)visitDeltaFiles;
- (void)_closeFiles;
- (void)_performVisit:(id)a3;
- (void)setUnsorted:(BOOL)a3;
- (void)setVisitDeltaFiles:(BOOL)a3;
- (void)visitCaptureStore:(id)a3;
@end

@implementation DYInOrderInstructionFilesVisitor

- (BOOL)_openFilenames:(id)a3 store:(id)a4 filesArray:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(a3);
      }
      uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
      uint64_t v15 = 0;
      uint64_t v13 = [a4 openFileWithFilename:v12 error:&v15];
      if (!v13) {
        break;
      }
      [a5 addObject:v13];
      if (v9 == ++v11)
      {
        uint64_t v9 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (BOOL)_openFiles:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  context = (void *)MEMORY[0x2533604C0](self, a2);
  v5 = objc_opt_new();
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", *MEMORY[0x263F3FBB0], 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_));
  uint64_t v6 = *MEMORY[0x263F3FBA8];
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", *MEMORY[0x263F3FBA8], 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_));
  uint64_t v7 = *MEMORY[0x263F3FBB8];
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", *MEMORY[0x263F3FBB8], 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_));
  uint64_t v8 = *MEMORY[0x263F3FB88];
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", *MEMORY[0x263F3FB88], 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_));
  if ([(DYCaptureVisitor *)self visitUnusedResoures]) {
    [v5 addObjectsFromArray:objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", *MEMORY[0x263F3FBC8], v8, context), 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_)];
  }
  uint64_t v9 = (NSArray *)objc_opt_new();
  BOOL v10 = [(DYInOrderInstructionFilesVisitor *)self _openFilenames:v5 store:a3 filesArray:v9];
  self->_initialPhaseFiles = v9;

  if (!v10) {
    goto LABEL_13;
  }
  if (self->_unsorted)
  {
    uint64_t v11 = (void *)[a3 filenamesWithPrefix:*MEMORY[0x263F3FBC0] error:0];
    if ([v11 count]) {
      goto LABEL_9;
    }
    uint64_t v12 = (void *)MEMORY[0x263F3FB98];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x263F3FB78];
  }
  uint64_t v11 = (void *)[a3 filenamesWithPrefix:*v12 error:0];
LABEL_9:
  if ([v11 count] != 1)
  {
    [v11 count];
    DYLog();
    long long v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F07F70];
    uint64_t v28 = *MEMORY[0x263F08320];
    uint64_t v21 = v28;
    v29[0] = [NSString stringWithFormat:@"Capture file names: %@", v11];
    uint64_t v22 = objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 256, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, &v28, 1));
    uint64_t v23 = *MEMORY[0x263F08608];
    v26[0] = v21;
    v26[1] = v23;
    v27[0] = @"The gputrace is invalid because it contains multiple capture archives.";
    v27[1] = v22;
    -[DYCaptureVisitor setVisitCaptureArchiveError:](self, "setVisitCaptureArchiveError:", objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", v20, 256, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 2)));
    goto LABEL_13;
  }
  uint64_t v13 = (NSArray *)objc_opt_new();
  BOOL v14 = -[DYInOrderInstructionFilesVisitor _openFilenames:store:filesArray:](self, "_openFilenames:store:filesArray:", [v11 sortedArrayUsingSelector:sel_dy_numericCompare_], a3, v13);
  self->_captureFiles = v13;
  if (!v14)
  {
LABEL_13:
    BOOL v18 = 0;
    goto LABEL_14;
  }
  uint64_t v15 = objc_opt_new();
  uint64_t v16 = *MEMORY[0x263F3FB80];
  [v15 addObjectsFromArray:objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", *MEMORY[0x263F3FB80], v6), 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_)];
  [v15 addObjectsFromArray:objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", v16, v7), 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_)];
  [v15 addObjectsFromArray:objc_msgSend((id)objc_msgSend(a3, "filenamesWithPrefix:error:", objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", v16, v8), 0), "sortedArrayUsingSelector:", sel_dy_numericCompare_)];
  long long v17 = (NSArray *)objc_opt_new();
  BOOL v18 = [(DYInOrderInstructionFilesVisitor *)self _openFilenames:v15 store:a3 filesArray:v17];
  self->_deltaFiles = v17;

LABEL_14:
  return v18;
}

- (void)_closeFiles
{
  self->_initialPhaseFiles = 0;
  self->_deltaFiles = 0;

  self->_captureFiles = 0;
}

- (void)_performVisit:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x2533604C0](self, a2, a3);
  [(DYInOrderInstructionFilesVisitor *)self performPreVisitActions];
  if (!self->super._abort)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    initialPhaseFiles = self->_initialPhaseFiles;
    uint64_t v6 = [(NSArray *)initialPhaseFiles countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v29;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(initialPhaseFiles);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * v9) acceptCaptureVisitor:self];
        if (self->super._abort) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [(NSArray *)initialPhaseFiles countByEnumeratingWithState:&v28 objects:v34 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      [(DYInOrderInstructionFilesVisitor *)self performPreCaptureVisitActions];
      if (!self->super._abort)
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        captureFiles = self->_captureFiles;
        uint64_t v11 = [(NSArray *)captureFiles countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v25;
LABEL_13:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(captureFiles);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * v14) acceptCaptureVisitor:self];
            if (self->super._abort) {
              break;
            }
            if (v12 == ++v14)
            {
              uint64_t v12 = [(NSArray *)captureFiles countByEnumeratingWithState:&v24 objects:v33 count:16];
              if (v12) {
                goto LABEL_13;
              }
              goto LABEL_19;
            }
          }
        }
        else
        {
LABEL_19:
          [(DYInOrderInstructionFilesVisitor *)self performPostCaptureVisitActions];
          if (!self->super._abort && self->_visitDeltaFiles)
          {
            long long v22 = 0u;
            long long v23 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            deltaFiles = self->_deltaFiles;
            uint64_t v16 = [(NSArray *)deltaFiles countByEnumeratingWithState:&v20 objects:v32 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v21;
LABEL_23:
              uint64_t v19 = 0;
              while (1)
              {
                if (*(void *)v21 != v18) {
                  objc_enumerationMutation(deltaFiles);
                }
                [*(id *)(*((void *)&v20 + 1) + 8 * v19) acceptCaptureVisitor:self];
                if (self->super._abort) {
                  break;
                }
                if (v17 == ++v19)
                {
                  uint64_t v17 = [(NSArray *)deltaFiles countByEnumeratingWithState:&v20 objects:v32 count:16];
                  if (v17) {
                    goto LABEL_23;
                  }
                  break;
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)visitCaptureStore:(id)a3
{
  if (-[DYInOrderInstructionFilesVisitor _openFiles:](self, "_openFiles:")) {
    [(DYInOrderInstructionFilesVisitor *)self _performVisit:a3];
  }
  [(DYInOrderInstructionFilesVisitor *)self _closeFiles];
}

- (BOOL)visitDeltaFiles
{
  return self->_visitDeltaFiles;
}

- (void)setVisitDeltaFiles:(BOOL)a3
{
  self->_visitDeltaFiles = a3;
}

- (BOOL)unsorted
{
  return self->_unsorted;
}

- (void)setUnsorted:(BOOL)a3
{
  self->_unsorted = a3;
}

@end