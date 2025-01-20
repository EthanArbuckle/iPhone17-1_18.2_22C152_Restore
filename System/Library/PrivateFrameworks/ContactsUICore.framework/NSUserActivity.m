@interface NSUserActivity
@end

@implementation NSUserActivity

id __79__NSUserActivity_ContactsUICore___cnui_startAudioCallIntentWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (objc_class *)MEMORY[0x263F0FFC0];
  id v3 = a2;
  id v4 = [v2 alloc];
  v8[0] = v3;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  v6 = (void *)[v4 initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:0 destinationType:1 contacts:v5 callCapability:1];
  return v6;
}

id __79__NSUserActivity_ContactsUICore___cnui_startVideoCallIntentWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (objc_class *)MEMORY[0x263F0FFC0];
  id v3 = a2;
  id v4 = [v2 alloc];
  v8[0] = v3;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  v6 = (void *)[v4 initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:0 destinationType:1 contacts:v5 callCapability:2];
  return v6;
}

id __76__NSUserActivity_ContactsUICore___cnui_sendMessageIntentWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (objc_class *)MEMORY[0x263F0FEA8];
  id v3 = a2;
  id v4 = [v2 alloc];
  v8[0] = v3;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  v6 = (void *)[v4 initWithRecipients:v5 outgoingMessageType:1 content:0 speakableGroupName:0 conversationIdentifier:0 serviceName:0 sender:0 attachments:0];
  return v6;
}

@end