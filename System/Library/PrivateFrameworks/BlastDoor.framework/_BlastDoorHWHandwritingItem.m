@interface _BlastDoorHWHandwritingItem
+ (id)createHandwritingItem:(id)a3 uuid:(id)a4 date:(id)a5;
@end

@implementation _BlastDoorHWHandwritingItem

+ (id)createHandwritingItem:(id)a3 uuid:(id)a4 date:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (getHWHandwritingItemClass())
  {
    v10 = (void *)[objc_alloc((Class)getHWHandwritingItemClass()) initWithDrawing:v7];
    [v10 setUuid:v8];
    [v10 setCreationDate:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end