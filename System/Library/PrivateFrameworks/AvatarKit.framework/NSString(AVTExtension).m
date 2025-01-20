@interface NSString(AVTExtension)
- (void)avt_diffAgainst:()AVTExtension suppressCommonLines:completionHandler:;
@end

@implementation NSString(AVTExtension)

- (void)avt_diffAgainst:()AVTExtension suppressCommonLines:completionHandler:
{
  v35[5] = *MEMORY[0x263EF8340];
  id v26 = a3;
  v24 = a5;
  v27 = NSTemporaryDirectory();
  v8 = [MEMORY[0x263F08C38] UUID];
  v28 = [v8 UUIDString];

  v9 = [v28 stringByAppendingString:@"-old.shader"];
  v25 = [v27 stringByAppendingPathComponent:v9];

  v10 = [v28 stringByAppendingString:@"-new.shader"];
  v11 = [v27 stringByAppendingPathComponent:v10];

  [a1 writeToFile:v25 atomically:1 encoding:4 error:0];
  [v26 writeToFile:v11 atomically:1 encoding:4 error:0];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 130;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __80__NSString_AVTExtension__avt_diffAgainst_suppressCommonLines_completionHandler___block_invoke;
  v29[3] = &unk_2640205A8;
  v29[4] = &v30;
  v12 = (void *)MEMORY[0x210539A20](v29);
  [a1 enumerateLinesUsingBlock:v12];
  [v26 enumerateLinesUsingBlock:v12];
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"--width=%llu", v31[3]);
  v14 = [MEMORY[0x263F08A80] pipe];
  v15 = [MEMORY[0x263F08A80] pipe];
  id v16 = objc_alloc_init(MEMORY[0x263F08B50]);
  [v16 setLaunchPath:@"/usr/bin/sdiff"];
  [v16 setStandardOutput:v14];
  [v16 setStandardError:v15];
  if (a4)
  {
    v35[0] = @"--expand-tabs";
    v35[1] = @"--suppress-common-lines";
    v35[2] = v13;
    v35[3] = v25;
    v35[4] = v11;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:5];
  }
  else
  {
    v34[0] = @"--expand-tabs";
    v34[1] = v13;
    v34[2] = v25;
    v34[3] = v11;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  v17 = };
  [v16 setArguments:v17];

  [v16 launch];
  [v16 waitUntilExit];
  v18 = [v14 fileHandleForReading];
  v19 = [v18 readDataToEndOfFile];

  v20 = (void *)[[NSString alloc] initWithData:v19 encoding:4];
  v21 = [v15 fileHandleForReading];
  v22 = [v21 readDataToEndOfFile];

  if ([v22 length])
  {
    v23 = (void *)[[NSString alloc] initWithData:v22 encoding:4];
    NSLog(&stru_26BFDD760.isa, v23);
    v24[2](v24, 0, v23);
  }
  else
  {
    ((void (**)(id, void *, void *))v24)[2](v24, v20, 0);
  }

  _Block_object_dispose(&v30, 8);
}

@end