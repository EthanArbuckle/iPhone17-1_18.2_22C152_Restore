@interface DESDPBitValueRecorder
- (BOOL)record:(id)a3 data:(id)a4 metadata:(id)a5;
@end

@implementation DESDPBitValueRecorder

- (BOOL)record:(id)a3 data:(id)a4 metadata:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v7 = (objc_class *)MEMORY[0x1E4F5F468];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithKey:v10];

  v14[0] = v9;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  LOBYTE(v9) = [v11 recordBitVectors:v12 metadata:v8];
  return (char)v9;
}

@end