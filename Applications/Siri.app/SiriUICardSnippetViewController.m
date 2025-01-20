@interface SiriUICardSnippetViewController
- (void)emitInstrumentationEvent:(id)a3;
- (void)informHostOfBackgroundColor:(id)a3;
- (void)informHostOfBackgroundMaterial:(int64_t)a3;
@end

@implementation SiriUICardSnippetViewController

- (void)emitInstrumentationEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  SiriUICardSnippetViewController.emitInstrumentationEvent(_:)(v4);
}

- (void)informHostOfBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  SiriUICardSnippetViewController.informHostOfBackgroundColor(_:)(v9);
}

- (void)informHostOfBackgroundMaterial:(int64_t)a3
{
  id v4 = self;
  SiriUICardSnippetViewController.informHostOfBackgroundMaterial(_:)(a3);
}

@end