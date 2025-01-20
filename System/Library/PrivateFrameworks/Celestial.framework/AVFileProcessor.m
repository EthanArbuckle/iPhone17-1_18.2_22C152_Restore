@interface AVFileProcessor
+ (id)fileProcessor;
- (id)processPurchasedItem:(id)a3 withAttributes:(id)a4;
- (id)processPurchasedItem:(id)a3 withAttributes:(id)a4 progressBlock:(id)a5;
- (id)processPurchasedItem:(id)a3 withAttributes:(id)a4 resultInfo:(id *)a5;
- (id)processPurchasedItem:(id)a3 withAttributes:(id)a4 resultInfo:(id *)a5 progressBlock:(id)a6;
- (id)rentalInfo:(id)a3;
- (id)sinfInfoFromFilePath:(id)a3;
- (id)sinfsFromFilePath:(id)a3;
- (void)dealloc;
@end

@implementation AVFileProcessor

+ (id)fileProcessor
{
  v2 = objc_alloc_init(AVFileProcessor);

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVFileProcessor;
  [(AVFileProcessor *)&v3 dealloc];
}

- (id)processPurchasedItem:(id)a3 withAttributes:(id)a4
{
  return [(AVFileProcessor *)self processPurchasedItem:a3 withAttributes:a4 resultInfo:0 progressBlock:0];
}

- (id)processPurchasedItem:(id)a3 withAttributes:(id)a4 progressBlock:(id)a5
{
  return [(AVFileProcessor *)self processPurchasedItem:a3 withAttributes:a4 resultInfo:0 progressBlock:a5];
}

- (id)processPurchasedItem:(id)a3 withAttributes:(id)a4 resultInfo:(id *)a5
{
  return [(AVFileProcessor *)self processPurchasedItem:a3 withAttributes:a4 resultInfo:a5 progressBlock:0];
}

- (id)processPurchasedItem:(id)a3 withAttributes:(id)a4 resultInfo:(id *)a5 progressBlock:(id)a6
{
  self->_percentComplete = 0.0;
  v7 = (void *)[a6 copy];

  self->_progressBlock = v7;
  int v8 = PostProcessPurchasedItem();
  if (v8) {
    v9 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v8 userInfo:0];
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (id)rentalInfo:(id)a3
{
  return 0;
}

- (id)sinfsFromFilePath:(id)a3
{
  return 0;
}

- (id)sinfInfoFromFilePath:(id)a3
{
  return 0;
}

@end