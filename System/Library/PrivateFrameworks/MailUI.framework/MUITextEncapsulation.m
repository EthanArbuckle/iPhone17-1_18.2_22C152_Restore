@interface MUITextEncapsulation
+ (id)messageListDateTextEncapsulationWithColor:(id)a3;
@end

@implementation MUITextEncapsulation

+ (id)messageListDateTextEncapsulationWithColor:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F24388];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setColor:v4];

  [v5 setScale:0];
  [v5 setStyle:1];
  [v5 setPlatterSize:0];
  [v5 setShape:2];
  return v5;
}

@end