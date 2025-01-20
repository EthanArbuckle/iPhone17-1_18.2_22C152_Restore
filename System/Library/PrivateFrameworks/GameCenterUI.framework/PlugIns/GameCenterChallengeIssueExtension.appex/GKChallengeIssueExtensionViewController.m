@interface GKChallengeIssueExtensionViewController
- (BOOL)_useBackdropViewForWindowBackground;
- (BOOL)forcePicker;
- (GKChallenge)challenge;
- (GKChallengeIssueExtensionViewController)initWithCoder:(id)a3;
- (NSArray)players;
- (NSString)defaultMessage;
- (id)completionHandler;
- (id)hostObjectProxy;
- (void)constructContentViewController;
- (void)setChallenge:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDefaultMessage:(id)a3;
- (void)setForcePicker:(BOOL)a3;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setPlayers:(id)a3;
@end

@implementation GKChallengeIssueExtensionViewController

- (GKChallengeIssueExtensionViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKChallengeIssueExtensionViewController;
  v3 = [(GKChallengeIssueExtensionViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(GKChallengeIssueExtensionViewController *)v3 setAlwaysShowDoneButton:0];
    [(GKChallengeIssueExtensionViewController *)v4 setForcePicker:0];
  }
  return v4;
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  uint64_t v6 = GKExtensionItemChallengeInternalKey;
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 objectForKeyedSubscript:v6];
  v10 = +[GKChallenge challengeForInternalRepresentation:v9];
  [(GKChallengeIssueExtensionViewController *)self setChallenge:v10];

  v11 = [v8 objectForKeyedSubscript:GKExtensionItemMessageKey];
  [(GKChallengeIssueExtensionViewController *)self setDefaultMessage:v11];

  v12 = [v8 objectForKeyedSubscript:GKExtensionItemForcePickerKey];
  -[GKChallengeIssueExtensionViewController setForcePicker:](self, "setForcePicker:", [v12 BOOLValue]);

  v13 = [v8 objectForKeyedSubscript:GKExtensionItemPlayerInternalsKey];
  v14 = [v13 _gkMapWithBlock:&stru_1000041A8];
  [(GKChallengeIssueExtensionViewController *)self setPlayers:v14];

  v15.receiver = self;
  v15.super_class = (Class)GKChallengeIssueExtensionViewController;
  [(GKChallengeIssueExtensionViewController *)&v15 setInitialState:v8 withReply:v7];
}

- (void)constructContentViewController
{
  id v3 = objc_alloc_init((Class)UIViewController);
  [(GKChallengeIssueExtensionViewController *)self setContentViewController:v3];

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_100002880;
  v10[4] = sub_100002890;
  v11 = self;
  challenge = v11->_challenge;
  players = v11->_players;
  defaultMessage = v11->_defaultMessage;
  BOOL forcePicker = v11->_forcePicker;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002898;
  v9[3] = &unk_1000041D0;
  v9[4] = v11;
  v9[5] = v10;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000293C;
  v8[3] = &unk_100004238;
  v8[4] = v10;
  +[GKChallengeComposeController composeAndSendFlowForChallenge:challenge selectPlayers:players defaultMessage:defaultMessage forcePicker:forcePicker readyHandler:v9 completionHandler:v8];
  _Block_object_dispose(v10, 8);
}

- (BOOL)_useBackdropViewForWindowBackground
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)1)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v5 = +[GKGame currentGame];
    unsigned int v4 = [v5 isGameCenter] ^ 1;
  }
  return v4;
}

- (id)hostObjectProxy
{
  unsigned int v4 = [(GKChallengeIssueExtensionViewController *)self extensionContext];
  v5 = [v4 _auxiliaryConnection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_100004278];

  if (!v6)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"GKChallengeIssueExtensionViewController.m" lineNumber:112 description:@"GKChallengeIssueExtensionContext remote object proxy is nil!"];
  }

  return v6;
}

- (GKChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSString)defaultMessage
{
  return self->_defaultMessage;
}

- (void)setDefaultMessage:(id)a3
{
}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
}

- (BOOL)forcePicker
{
  return self->_forcePicker;
}

- (void)setForcePicker:(BOOL)a3
{
  self->_BOOL forcePicker = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_defaultMessage, 0);

  objc_storeStrong((id *)&self->_challenge, 0);
}

@end