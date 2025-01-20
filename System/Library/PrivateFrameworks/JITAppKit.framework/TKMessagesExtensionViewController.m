@interface TKMessagesExtensionViewController
- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4;
- (void)didReceiveMessage:(id)a3 conversation:(id)a4;
- (void)didResignActiveWithConversation:(id)a3;
- (void)didStartSendingMessage:(id)a3 conversation:(id)a4;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation TKMessagesExtensionViewController

- (void)willBecomeActiveWithConversation:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v7[0] = location[0];
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](v3, "emitTMLSignal:withArguments:", @"willBecomeActive");

  objc_storeStrong(location, 0);
}

- (void)didResignActiveWithConversation:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v6;
  v7[0] = location[0];
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](v3, "emitTMLSignal:withArguments:", @"didResignActive");

  objc_storeStrong(location, 0);
}

- (void)didReceiveMessage:(id)a3 conversation:(id)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = v9;
  v10[0] = location[0];
  v10[1] = v7;
  id v6 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](v5, "emitTMLSignal:withArguments:", @"didReceive");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)didStartSendingMessage:(id)a3 conversation:(id)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = v9;
  v10[0] = location[0];
  v10[1] = v7;
  id v6 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](v5, "emitTMLSignal:withArguments:", @"didStartSending");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = v9;
  v10[0] = location[0];
  v10[1] = v7;
  id v6 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](v5, "emitTMLSignal:withArguments:", @"didCancelSendingMessage");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = (id)[NSNumber numberWithUnsignedInt:a3];
  v6[0] = v5;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](self, "emitTMLSignal:withArguments:", @"willTransitionToPresentationStyle");
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = (id)[NSNumber numberWithUnsignedInt:a3];
  v6[0] = v5;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  -[TKMessagesExtensionViewController emitTMLSignal:withArguments:](self, "emitTMLSignal:withArguments:", @"didTransitionToPresentationStyle");
}

@end