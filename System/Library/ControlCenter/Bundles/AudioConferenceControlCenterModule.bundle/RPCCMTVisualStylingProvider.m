@interface RPCCMTVisualStylingProvider
+ (id)_visualStylingProviderForRecipe:(int64_t)a3 andCategory:(int64_t)a4;
+ (id)_visualStylingProviderForStyleSetNamed:(id)a3 inBundle:(id)a4;
- (RPCCMTVisualStylingProvider)initWithProvider:(id)a3;
- (RPCCMTVisualStylingProvider)initWithStyle:(id)a3 inBundle:(id)a4;
- (id)_colorForStyle:(int64_t)a3;
- (void)automaticallyUpdateView:(id)a3 withStyle:(int64_t)a4;
- (void)stopAutomaticallyUpdatingView:(id)a3;
@end

@implementation RPCCMTVisualStylingProvider

- (void)automaticallyUpdateView:(id)a3 withStyle:(int64_t)a4
{
}

- (void)stopAutomaticallyUpdatingView:(id)a3
{
}

- (id)_colorForStyle:(int64_t)a3
{
  v3 = [(MTVisualStylingProvider *)self->opaqueObj _visualStylingForStyle:a3];
  v4 = [v3 color];

  return v4;
}

+ (id)_visualStylingProviderForStyleSetNamed:(id)a3 inBundle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[RPCCMTVisualStylingProvider alloc] initWithStyle:v6 inBundle:v5];

  return v7;
}

+ (id)_visualStylingProviderForRecipe:(int64_t)a3 andCategory:(int64_t)a4
{
  v4 = [sub_456C() _visualStylingProviderForRecipe:a3 andCategory:a4];
  id v5 = [[RPCCMTVisualStylingProvider alloc] initWithProvider:v4];

  return v5;
}

- (RPCCMTVisualStylingProvider)initWithStyle:(id)a3 inBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RPCCMTVisualStylingProvider;
  v8 = [(RPCCMTVisualStylingProvider *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [sub_456C() _visualStylingProviderForStyleSetNamed:v6 inBundle:v7];
    opaqueObj = v8->opaqueObj;
    v8->opaqueObj = (MTVisualStylingProvider *)v9;
  }
  return v8;
}

- (RPCCMTVisualStylingProvider)initWithProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPCCMTVisualStylingProvider;
  id v6 = [(RPCCMTVisualStylingProvider *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->opaqueObj, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end