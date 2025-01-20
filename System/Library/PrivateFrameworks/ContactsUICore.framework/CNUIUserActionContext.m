@interface CNUIUserActionContext
+ (id)contextWithExtensionContext:(id)a3;
+ (id)makeDefaultContext;
- (BOOL)isOriginatingFromFavorites;
- (BSServiceConnectionEndpoint)connectionEndpoint;
- (CNUIUserActionContext)init;
- (CNUIUserActionContext)initWithContactStore:(id)a3 applicationWorkspace:(id)a4;
- (CNUIUserActionCurator)actionCurator;
- (CNUIUserActionDialRequestOpener)dialRequestOpener;
- (CNUIUserActionRecorder)actionRecorder;
- (CNUIUserActionURLOpener)urlOpener;
- (CNUIUserActionUserActivityOpener)userActivityOpener;
- (NSString)channelIdentifier;
- (void)setActionCurator:(id)a3;
- (void)setActionRecorder:(id)a3;
- (void)setChannelIdentifier:(id)a3;
- (void)setConnectionEndpoint:(id)a3;
- (void)setDialRequestOpener:(id)a3;
- (void)setIsOriginatingFromFavorites:(BOOL)a3;
- (void)setUrlOpener:(id)a3;
- (void)setUserActivityOpener:(id)a3;
@end

@implementation CNUIUserActionContext

- (CNUIUserActionContext)initWithContactStore:(id)a3 applicationWorkspace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CNUIUserActionContext *)self init];
  if (v8)
  {
    v9 = [[_CNUIUserActionCurator alloc] initWithContactStore:v6 applicationWorkspace:v7];
    actionCurator = v8->_actionCurator;
    v8->_actionCurator = (CNUIUserActionCurator *)v9;

    v11 = v8;
  }

  return v8;
}

- (CNUIUserActionContext)init
{
  v15.receiver = self;
  v15.super_class = (Class)CNUIUserActionContext;
  v2 = [(CNUIUserActionContext *)&v15 init];
  if (v2)
  {
    v3 = objc_alloc_init(CNUIUserActionWorkspaceURLOpener);
    urlOpener = v2->_urlOpener;
    v2->_urlOpener = (CNUIUserActionURLOpener *)v3;

    v5 = objc_alloc_init(_CNUIUserActionUserActivityOpener);
    userActivityOpener = v2->_userActivityOpener;
    v2->_userActivityOpener = (CNUIUserActionUserActivityOpener *)v5;

    id v7 = objc_alloc_init(_CNUIUserActionDialRequestOpener);
    dialRequestOpener = v2->_dialRequestOpener;
    v2->_dialRequestOpener = (CNUIUserActionDialRequestOpener *)v7;

    v9 = objc_alloc_init(CNUIDefaultUserActionRecorder);
    actionRecorder = v2->_actionRecorder;
    v2->_actionRecorder = (CNUIUserActionRecorder *)v9;

    v11 = objc_alloc_init(_CNUIUserActionCurator);
    actionCurator = v2->_actionCurator;
    v2->_actionCurator = (CNUIUserActionCurator *)v11;

    v13 = v2;
  }

  return v2;
}

+ (id)contextWithExtensionContext:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CNUIUserActionContext);
  v5 = [[CNUIUserActionExtensionURLOpener alloc] initWithExtensionContext:v3];

  [(CNUIUserActionContext *)v4 setUrlOpener:v5];
  id v6 = objc_alloc_init(_CNUIUserActionUserActivityOpener);
  [(CNUIUserActionContext *)v4 setUserActivityOpener:v6];

  id v7 = objc_alloc_init(CNUIDefaultUserActionRecorder);
  [(CNUIUserActionContext *)v4 setActionRecorder:v7];

  v8 = objc_alloc_init(_CNUIUserActionCurator);
  [(CNUIUserActionContext *)v4 setActionCurator:v8];

  return v4;
}

+ (id)makeDefaultContext
{
  v2 = objc_alloc_init(CNUIUserActionContext);
  id v3 = objc_alloc_init(CNUIUserActionWorkspaceURLOpener);
  [(CNUIUserActionContext *)v2 setUrlOpener:v3];

  v4 = objc_alloc_init(_CNUIUserActionUserActivityOpener);
  [(CNUIUserActionContext *)v2 setUserActivityOpener:v4];

  v5 = objc_alloc_init(CNUIDefaultUserActionRecorder);
  [(CNUIUserActionContext *)v2 setActionRecorder:v5];

  id v6 = objc_alloc_init(_CNUIUserActionCurator);
  [(CNUIUserActionContext *)v2 setActionCurator:v6];

  return v2;
}

- (CNUIUserActionURLOpener)urlOpener
{
  return self->_urlOpener;
}

- (void)setUrlOpener:(id)a3
{
}

- (CNUIUserActionUserActivityOpener)userActivityOpener
{
  return self->_userActivityOpener;
}

- (void)setUserActivityOpener:(id)a3
{
}

- (CNUIUserActionDialRequestOpener)dialRequestOpener
{
  return self->_dialRequestOpener;
}

- (void)setDialRequestOpener:(id)a3
{
}

- (CNUIUserActionRecorder)actionRecorder
{
  return self->_actionRecorder;
}

- (void)setActionRecorder:(id)a3
{
}

- (CNUIUserActionCurator)actionCurator
{
  return self->_actionCurator;
}

- (void)setActionCurator:(id)a3
{
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (void)setChannelIdentifier:(id)a3
{
}

- (BSServiceConnectionEndpoint)connectionEndpoint
{
  return self->_connectionEndpoint;
}

- (void)setConnectionEndpoint:(id)a3
{
}

- (BOOL)isOriginatingFromFavorites
{
  return self->_isOriginatingFromFavorites;
}

- (void)setIsOriginatingFromFavorites:(BOOL)a3
{
  self->_isOriginatingFromFavorites = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionEndpoint, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
  objc_storeStrong((id *)&self->_actionCurator, 0);
  objc_storeStrong((id *)&self->_actionRecorder, 0);
  objc_storeStrong((id *)&self->_dialRequestOpener, 0);
  objc_storeStrong((id *)&self->_userActivityOpener, 0);
  objc_storeStrong((id *)&self->_urlOpener, 0);
}

@end