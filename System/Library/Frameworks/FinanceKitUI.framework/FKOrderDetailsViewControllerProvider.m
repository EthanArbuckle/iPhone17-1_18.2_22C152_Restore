@interface FKOrderDetailsViewControllerProvider
+ (id)makeViewControllerWithOrderTypeIdentifier:(id)a3 orderIdentifier:(id)a4 fulfillmentIdentifier:(id)a5;
@end

@implementation FKOrderDetailsViewControllerProvider

+ (id)makeViewControllerWithOrderTypeIdentifier:(id)a3 orderIdentifier:(id)a4 fulfillmentIdentifier:(id)a5
{
  return +[OrderDetailsViewControllerProvider makeViewControllerWithOrderTypeIdentifier:a3 orderIdentifier:a4 fulfillmentIdentifier:a5];
}

@end