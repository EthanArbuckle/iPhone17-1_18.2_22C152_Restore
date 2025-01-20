@interface INSendPaymentIntent(ATXIntentEvent)
- (void)atx_getArgsInto:()ATXIntentEvent;
@end

@implementation INSendPaymentIntent(ATXIntentEvent)

- (void)atx_getArgsInto:()ATXIntentEvent
{
  id v4 = a3;
  v5 = [a1 payee];
  v6 = [v5 displayName];
  [v4 setArg1:v6];

  id v9 = [a1 currencyAmount];
  v7 = [v9 amount];
  v8 = roundedDecimal(v7);
  [v4 setArg2:v8];
}

@end