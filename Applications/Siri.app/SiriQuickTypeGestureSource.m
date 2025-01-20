@interface SiriQuickTypeGestureSource
- (SiriQuickTypeGestureSource)init;
- (id)prewarm;
- (void)activate;
- (void)configureConnection;
@end

@implementation SiriQuickTypeGestureSource

- (SiriQuickTypeGestureSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)SiriQuickTypeGestureSource;
  v2 = [(SiriQuickTypeGestureSource *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SiriQuickTypeGestureSource *)v2 configureConnection];
  }
  return v3;
}

- (void)configureConnection
{
  v3 = +[SASBoardServicesConfiguration configuration];
  v4 = [v3 machServiceIdentifier];
  objc_super v5 = +[SASBoardServicesConfiguration configuration];
  v6 = [v5 identifierForService:1];
  v7 = +[BSServiceConnectionEndpoint endpointForMachName:v4 service:v6 instance:0];

  uint64_t v8 = +[BSServiceConnection connectionWithEndpoint:v7];
  uint64_t v9 = OBJC_IVAR___SiriActivationSource__connection;
  v10 = *(void **)&self->SiriActivationSource_opaque[OBJC_IVAR___SiriActivationSource__connection];
  *(void *)&self->SiriActivationSource_opaque[OBJC_IVAR___SiriActivationSource__connection] = v8;

  objc_initWeak(&location, self);
  v11 = *(void **)&self->SiriActivationSource_opaque[v9];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_100073DC4;
  v15 = &unk_1001449E8;
  objc_copyWeak(&v16, &location);
  [v11 configureConnection:&v12];
  [*(id *)&self->SiriActivationSource_opaque[v9] activate:v12, v13, v14, v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (id)prewarm
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = sub_100007210(Current);
  objc_initWeak(&location, self);
  id v5 = objc_alloc((Class)SiriActivityAssertion);
  v6 = +[NSUUID UUID];
  v7 = [v6 UUIDString];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10007439C;
  v15 = &unk_100144A10;
  objc_copyWeak(&v16, &location);
  id v8 = [v5 initWithIdentifier:v7 reference:@"SiriQuickTypeGestureSource.ActivityAssertion" reason:@"SiriQuickTypeGestureSource.ActivityAssertionReason.Prepare" timestamp:&v12 invalidationBlock:v4];

  uint64_t v9 = (os_unfair_lock_s *)&self->SiriActivationSource_opaque[OBJC_IVAR___SiriActivationSource__lock];
  os_unfair_lock_lock(v9);
  v10 = [*(id *)&self->SiriActivationSource_opaque[OBJC_IVAR___SiriActivationSource__connection] remoteTarget:v12, v13, v14, v15];
  [v10 prewarmForFirstTapOfQuickTypeToSiriGesture];

  os_unfair_lock_unlock(v9);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v8;
}

- (void)activate
{
  v3 = (os_unfair_lock_s *)&self->SiriActivationSource_opaque[OBJC_IVAR___SiriActivationSource__lock];
  os_unfair_lock_lock(v3);
  double v4 = [*(id *)&self->SiriActivationSource_opaque[OBJC_IVAR___SiriActivationSource__connection] remoteTarget];
  [v4 activationRequestFromSimpleActivation:&off_100149B98];

  os_unfair_lock_unlock(v3);
}

@end