@interface CKDPlaintextResponseBodyParser
- (void)finishWithCompletion:(id)a3;
- (void)processData:(id)a3 completionHandler:(id)a4;
@end

@implementation CKDPlaintextResponseBodyParser

- (void)processData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = objc_msgSend_parseQueue(self, v8, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4EFD5E8;
  block[3] = &unk_1E64F0FA0;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

- (void)finishWithCompletion:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_parseQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4EFD748;
  v9[3] = &unk_1E64F0E18;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

@end