@interface TUHandle
- (CNGeminiHandle)cnHandle;
@end

@implementation TUHandle

- (CNGeminiHandle)cnHandle
{
  v3 = [(TUHandle *)self value];
  if (v3)
  {
    id v4 = [(TUHandle *)self type];
    if (v4 == (id)2) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = -1;
    }
    if (v4 == (id)3) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    id v7 = [objc_alloc((Class)CNGeminiHandle) initWithString:v3 type:v6];
  }
  else
  {
    id v7 = 0;
  }

  return (CNGeminiHandle *)v7;
}

@end