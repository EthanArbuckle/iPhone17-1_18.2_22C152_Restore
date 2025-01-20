@interface CMLError
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5;
- (CMLError)initWithCode:(int64_t)a3 description:(id)a4;
- (CMLError)initWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5;
@end

@implementation CMLError

- (CMLError)initWithCode:(int64_t)a3 description:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F08320];
  v13[0] = a4;
  v6 = NSDictionary;
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)CMLError;
  v9 = [(CMLError *)&v11 initWithDomain:@"com.apple.CipherML" code:a3 userInfo:v8];

  return v9;
}

- (CMLError)initWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  v19[2] = *MEMORY[0x263EF8340];
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  objc_super v11 = [v10 localizedDescription];
  uint64_t v12 = [v8 stringWithFormat:@"%@: %@", v9, v11];

  uint64_t v13 = *MEMORY[0x263F08608];
  v18[0] = *MEMORY[0x263F08320];
  v18[1] = v13;
  v19[0] = v12;
  v19[1] = v10;
  v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v17.receiver = self;
  v17.super_class = (Class)CMLError;
  v15 = [(CMLError *)&v17 initWithDomain:@"com.apple.CipherML" code:a3 userInfo:v14];

  return v15;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  id v5 = a4;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCode:a3 description:v5];

  return v6;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 description:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc((Class)objc_opt_class());
  if (v7) {
    uint64_t v10 = [v9 initWithCode:a3 underlyingError:v7 description:v8];
  }
  else {
    uint64_t v10 = [v9 initWithCode:a3 description:v8];
  }
  objc_super v11 = (void *)v10;

  return v11;
}

@end