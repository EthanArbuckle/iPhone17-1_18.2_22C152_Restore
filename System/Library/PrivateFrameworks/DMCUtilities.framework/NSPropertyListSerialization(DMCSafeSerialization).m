@interface NSPropertyListSerialization(DMCSafeSerialization)
+ (id)DMCSafePropertyListWithData:()DMCSafeSerialization options:format:error:;
@end

@implementation NSPropertyListSerialization(DMCSafeSerialization)

+ (id)DMCSafePropertyListWithData:()DMCSafeSerialization options:format:error:
{
  id v10 = a3;
  if (v10)
  {
    v11 = [a1 propertyListWithData:v10 options:a4 format:a5 error:a6];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end