@interface CHHandle
- (TUHandle)tuHandle;
@end

@implementation CHHandle

- (TUHandle)tuHandle
{
  v3 = [(CHHandle *)self value];
  if (v3)
  {
    unint64_t v4 = (unint64_t)[(CHHandle *)self type];
    if (v4 > 3) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = qword_100085130[v4];
    }
    id v6 = [objc_alloc((Class)TUHandle) initWithType:v5 value:v3];
  }
  else
  {
    id v6 = 0;
  }

  return (TUHandle *)v6;
}

@end