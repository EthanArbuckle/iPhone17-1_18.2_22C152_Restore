@interface INIntentUtilsExportHelper
+ (id)INIntentCreate:(id)a3 withData:(id)a4;
+ (id)INIntentResponseCreate:(id)a3 withData:(id)a4;
@end

@implementation INIntentUtilsExportHelper

+ (id)INIntentResponseCreate:(id)a3 withData:(id)a4
{
  return INIntentResponseCreate(a3, a4);
}

+ (id)INIntentCreate:(id)a3 withData:(id)a4
{
  return INIntentCreate(a3, a4);
}

@end