@interface AVTComponentFactory
+ (id)alertActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
@end

@implementation AVTComponentFactory

+ (id)alertActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  return (id)[MEMORY[0x263F1C3F0] actionWithTitle:a3 style:a4 handler:a5];
}

@end