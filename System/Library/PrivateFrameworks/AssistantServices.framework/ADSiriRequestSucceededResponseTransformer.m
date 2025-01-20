@interface ADSiriRequestSucceededResponseTransformer
- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5;
@end

@implementation ADSiriRequestSucceededResponseTransformer

- (id)aceCommandForSiriResponse:(id)a3 responseError:(id)a4 forRequestCommand:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ADSiriRequestSucceededResponseTransformer.m", 24, @"Request succeeded response transformer expected response of type %@, but got %@ instead; request command: %@",
      objc_opt_class(),
      v8,
      v9);
  }
  id v10 = objc_alloc_init((Class)SACommandSucceeded);

  return v10;
}

@end