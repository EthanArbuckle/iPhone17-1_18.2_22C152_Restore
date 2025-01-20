@interface WFAppendUtilities
+ (id)fileByAppendingText:(id)a3 toFile:(id)a4 options:(unint64_t)a5;
@end

@implementation WFAppendUtilities

+ (id)fileByAppendingText:(id)a3 toFile:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v7 = a4;
  v8 = [a3 dataUsingEncoding:4];
  v9 = [@"\n" dataUsingEncoding:4];
  v10 = [v7 fileURL];
  if ((v5 & 4) != 0)
  {
    v11 = (void *)MEMORY[0x263F339A0];
    v12 = [v7 filename];
    uint64_t v13 = [v11 createTemporaryFileWithFilename:v12];

    v10 = (void *)v13;
  }
  v14 = [MEMORY[0x263F08840] fileHandleForWritingToURL:v10 error:0];
  v15 = v14;
  if ((v5 & 4) != 0)
  {
    [v14 writeData:v8];
    if ((v5 & 8) != 0) {
      [v15 writeData:v9];
    }
    v17 = [v7 mappedData];
    [v15 writeData:v17];

    [v15 closeFile];
    v18 = (void *)MEMORY[0x263F33870];
    v19 = [v7 wfType];
    v20 = [v7 filename];
    id v16 = [v18 fileWithURL:v10 options:1 ofType:v19 proposedFilename:v20];
  }
  else
  {
    [v14 seekToEndOfFile];
    if ((v5 & 8) != 0) {
      [v15 writeData:v9];
    }
    [v15 writeData:v8];
    [v15 closeFile];
    id v16 = v7;
  }

  return v16;
}

@end