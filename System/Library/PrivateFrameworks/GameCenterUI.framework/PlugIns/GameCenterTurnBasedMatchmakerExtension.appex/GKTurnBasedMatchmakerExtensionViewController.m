@interface GKTurnBasedMatchmakerExtensionViewController
- (BOOL)showExistingMatches;
- (BOOL)showPlay;
- (BOOL)showQuit;
- (GKMatchRequest)matchRequest;
- (id)hostObjectProxy;
- (id)turnBasedViewController;
- (void)constructContentViewController;
- (void)dismissWithGameController;
- (void)finishWithTurnBasedMatch:(id)a3;
- (void)messageFromClient:(id)a3;
- (void)quitTurnBasedMatch:(id)a3;
- (void)refreshMatches;
- (void)setInitialState:(id)a3 withReply:(id)a4;
- (void)setMatchRequest:(id)a3;
- (void)setShowExistingMatches:(BOOL)a3;
- (void)setShowPlay:(BOOL)a3;
- (void)setShowQuit:(BOOL)a3;
- (void)turnBasedViewController:(id)a3 didFailWithError:(id)a4;
- (void)turnBasedViewController:(id)a3 didFindMatch:(id)a4;
- (void)turnBasedViewController:(id)a3 playerQuitForMatch:(id)a4;
@end

@implementation GKTurnBasedMatchmakerExtensionViewController

- (id)turnBasedViewController
{
  return [(GKTurnBasedMatchmakerExtensionViewController *)self contentViewController];
}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:GKExtensionItemMatchesShowPlayForMatch];
  -[GKTurnBasedMatchmakerExtensionViewController setShowPlay:](self, "setShowPlay:", [v8 BOOLValue]);

  v9 = [v6 objectForKeyedSubscript:GKExtensionItemMatchesShowQuitForMatch];
  -[GKTurnBasedMatchmakerExtensionViewController setShowQuit:](self, "setShowQuit:", [v9 BOOLValue]);

  v10 = [v6 objectForKeyedSubscript:GKExtensionItemMatchesShowExistingMatches];
  -[GKTurnBasedMatchmakerExtensionViewController setShowExistingMatches:](self, "setShowExistingMatches:", [v10 BOOLValue]);

  v11 = [v6 objectForKeyedSubscript:GKExtensionItemMatchesMatchRequestInternal];
  if (v11)
  {
    id v12 = [objc_alloc((Class)GKMatchRequest) initWithInternalRepresentation:v11];
    [(GKTurnBasedMatchmakerExtensionViewController *)self setMatchRequest:v12];
  }
  v13.receiver = self;
  v13.super_class = (Class)GKTurnBasedMatchmakerExtensionViewController;
  [(GKTurnBasedMatchmakerExtensionViewController *)&v13 setInitialState:v6 withReply:v7];
}

- (void)constructContentViewController
{
  v3 = [(GKTurnBasedMatchmakerExtensionViewController *)self matchRequest];

  if (v3)
  {
    [(GKTurnBasedMatchmakerExtensionViewController *)self setAdjustTopConstraint:0];
    [(GKTurnBasedMatchmakerExtensionViewController *)self setAlwaysShowDoneButton:0];
    id v4 = objc_alloc((Class)GKTurnBasedMatchesViewController);
    v5 = [(GKTurnBasedMatchmakerExtensionViewController *)self matchRequest];
    id v6 = [v4 initWithMatchRequest:v5];
    [(GKTurnBasedMatchmakerExtensionViewController *)self setContentViewController:v6];

    id v7 = +[GKGame currentGame];
    v8 = [(GKTurnBasedMatchmakerExtensionViewController *)self turnBasedViewController];
    [v8 setGame:v7];

    v9 = [(GKTurnBasedMatchmakerExtensionViewController *)self turnBasedViewController];
    [v9 setDelegate:self];

    BOOL showExistingMatches = self->_showExistingMatches;
    v11 = [(GKTurnBasedMatchmakerExtensionViewController *)self turnBasedViewController];
    [v11 setShowExistingMatches:showExistingMatches];

    BOOL showPlay = self->_showPlay;
    objc_super v13 = [(GKTurnBasedMatchmakerExtensionViewController *)self turnBasedViewController];
    [v13 setShowPlay:showPlay];

    BOOL showQuit = self->_showQuit;
    v15 = [(GKTurnBasedMatchmakerExtensionViewController *)self turnBasedViewController];
    [v15 setShowQuit:showQuit];

    v16.receiver = self;
    v16.super_class = (Class)GKTurnBasedMatchmakerExtensionViewController;
    [(GKTurnBasedMatchmakerExtensionViewController *)&v16 constructContentViewController];
  }
}

- (void)messageFromClient:(id)a3
{
  id v4 = a3;
  v5 = GKExtensionProtocolSecureCodedClasses();
  id v16 = 0;
  id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v5 fromData:v4 error:&v16];
  id v7 = v16;

  if (v7)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    v9 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100002930((uint64_t)v7, v9);
    }
  }
  v10 = [v6 objectForKeyedSubscript:GKExtensionMessageCommandKey];
  uint64_t v11 = (uint64_t)[v10 integerValue];

  id v12 = [v6 objectForKeyedSubscript:GKExtensionMessageParamKey];
  objc_super v13 = v12;
  if (v11 <= 27)
  {
    if (v11 == 16)
    {
      -[GKTurnBasedMatchmakerExtensionViewController setShowPlay:](self, "setShowPlay:", [v12 BOOLValue]);
      goto LABEL_18;
    }
    if (v11 == 17)
    {
      -[GKTurnBasedMatchmakerExtensionViewController setShowQuit:](self, "setShowQuit:", [v12 BOOLValue]);
      goto LABEL_18;
    }
LABEL_17:
    v15.receiver = self;
    v15.super_class = (Class)GKTurnBasedMatchmakerExtensionViewController;
    [(GKTurnBasedMatchmakerExtensionViewController *)&v15 messageFromClient:v4];
    goto LABEL_18;
  }
  if (v11 == 43)
  {
    [(GKTurnBasedMatchmakerExtensionViewController *)self refreshMatches];
    goto LABEL_18;
  }
  if (v11 == 42)
  {
    -[GKTurnBasedMatchmakerExtensionViewController setShowExistingMatches:](self, "setShowExistingMatches:", [v12 BOOLValue]);
    goto LABEL_18;
  }
  if (v11 != 28) {
    goto LABEL_17;
  }
  id v14 = [objc_alloc((Class)GKMatchRequest) initWithInternalRepresentation:v12];
  [(GKTurnBasedMatchmakerExtensionViewController *)self setMatchRequest:v14];

LABEL_18:
}

- (void)setShowPlay:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL showPlay = a3;
  id v4 = [(GKTurnBasedMatchmakerExtensionViewController *)self turnBasedViewController];
  [v4 setShowPlay:v3];
}

- (void)setShowQuit:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL showQuit = a3;
  id v4 = [(GKTurnBasedMatchmakerExtensionViewController *)self turnBasedViewController];
  [v4 setShowQuit:v3];
}

- (void)refreshMatches
{
  id v2 = [(GKTurnBasedMatchmakerExtensionViewController *)self turnBasedViewController];
  [v2 setNeedsReload];
}

- (id)hostObjectProxy
{
  id v2 = [(GKTurnBasedMatchmakerExtensionViewController *)self extensionContext];
  BOOL v3 = [v2 _auxiliaryConnection];
  id v4 = [v3 remoteObjectProxyWithErrorHandler:&stru_100004190];

  return v4;
}

- (void)finishWithTurnBasedMatch:(id)a3
{
  v7[0] = &off_1000041F8;
  v6[0] = GKExtensionMessageCommandKey;
  v6[1] = GKExtensionMessageParamKey;
  id v4 = [a3 internal];
  v7[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKTurnBasedMatchmakerExtensionViewController *)self sendMessageToClient:v5];
}

- (void)quitTurnBasedMatch:(id)a3
{
  v7[0] = &off_100004210;
  v6[0] = GKExtensionMessageCommandKey;
  v6[1] = GKExtensionMessageParamKey;
  id v4 = [a3 internal];
  v7[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [(GKTurnBasedMatchmakerExtensionViewController *)self sendMessageToClient:v5];
}

- (void)dismissWithGameController
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GameController: GKTurnBasedMatchmakerExtensionViewController was dismissed by the game controller.", v5, 2u);
  }
  [(GKTurnBasedMatchmakerExtensionViewController *)self extensionIsCanceling];
}

- (void)turnBasedViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  v5 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", &off_100004228, GKExtensionMessageCommandKey, 0);
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:GKExtensionMessageParamKey];
  }
  [(GKTurnBasedMatchmakerExtensionViewController *)self sendMessageToClient:v5];
}

- (void)turnBasedViewController:(id)a3 didFindMatch:(id)a4
{
  v8[0] = &off_1000041F8;
  v7[0] = GKExtensionMessageCommandKey;
  v7[1] = GKExtensionMessageParamKey;
  v5 = objc_msgSend(a4, "internal", a3);
  v8[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [(GKTurnBasedMatchmakerExtensionViewController *)self sendMessageToClient:v6];
}

- (void)turnBasedViewController:(id)a3 playerQuitForMatch:(id)a4
{
  v8[0] = &off_100004210;
  v7[0] = GKExtensionMessageCommandKey;
  v7[1] = GKExtensionMessageParamKey;
  v5 = objc_msgSend(a4, "internal", a3);
  v8[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [(GKTurnBasedMatchmakerExtensionViewController *)self sendMessageToClient:v6];
}

- (GKMatchRequest)matchRequest
{
  return self->_matchRequest;
}

- (void)setMatchRequest:(id)a3
{
}

- (BOOL)showExistingMatches
{
  return self->_showExistingMatches;
}

- (void)setShowExistingMatches:(BOOL)a3
{
  self->_BOOL showExistingMatches = a3;
}

- (BOOL)showPlay
{
  return self->_showPlay;
}

- (BOOL)showQuit
{
  return self->_showQuit;
}

- (void).cxx_destruct
{
}

@end