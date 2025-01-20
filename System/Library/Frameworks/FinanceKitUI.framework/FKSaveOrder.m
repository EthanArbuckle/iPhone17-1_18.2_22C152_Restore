@interface FKSaveOrder
+ (void)saveOrderAtURL:(id)a3 completion:(id)a4;
@end

@implementation FKSaveOrder

+ (void)saveOrderAtURL:(id)a3 completion:(id)a4
{
  v5 = (void *)MEMORY[0x263EFF8F8];
  id v11 = 0;
  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = [v5 dataWithContentsOfURL:a3 options:1 error:&v11];
  id v8 = v11;
  v9 = v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10) {
    +[SaveOrderProvider saveOrderWithData:v7 completionHandler:v6];
  }
  else {
    v6[2](v6, 1, v8);
  }
}

@end