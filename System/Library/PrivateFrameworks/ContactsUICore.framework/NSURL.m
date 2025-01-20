@interface NSURL
@end

@implementation NSURL

uint64_t __24__NSURL_ContactsUI__log__block_invoke()
{
  log_cn_once_object_3 = (uint64_t)os_log_create("contactsui", "nsurl");
  return MEMORY[0x270F9A758]();
}

id __81__NSURL_ContactsUI___cnui_telephonyURLFutureWithHandle_contact_preferDefaultApp___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 48), "_cnui_telephonyURLWithHandle:contact:preferDefaultApp:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __68__NSURL_ContactsUI___cnui_faceTimeAudioURLFutureWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 48), "_cnui_faceTimeAudioURLWithHandle:contact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __68__NSURL_ContactsUI___cnui_faceTimeVideoURLFutureWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 48), "_cnui_faceTimeVideoURLWithHandle:contact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __58__NSURL_ContactsUI___cnui_ttyURLFutureWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 48), "_cnui_ttyURLWithHandle:contact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __63__NSURL_ContactsUI___cnui_ttyRelayURLFutureWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 48), "_cnui_ttyRelayURLWithHandle:contact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __99__NSURL_ContactsUI___cnui_telephonyURLFutureWithHandle_contact_channelIdentifier_preferDefaultApp___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 56), "_cnui_telephonyURLWithHandle:contact:channelIdentifier:preferDefaultApp:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __76__NSURL_ContactsUI___cnui_ttyURLFutureWithHandle_contact_channelIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 56), "_cnui_ttyURLWithHandle:contact:channelIdentifier:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __81__NSURL_ContactsUI___cnui_ttyRelayURLFutureWithHandle_contact_channelIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 56), "_cnui_ttyRelayURLWithHandle:contact:channelIdentifier:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __56__NSURL_ContactsUI___cnui_skypeTextURLFutureWithHandle___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 40), "_cnui_skypeTextURLWithHandle:", *(void *)(a1 + 32));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __57__NSURL_ContactsUI___cnui_skypeVoiceURLFutureWithHandle___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 40), "_cnui_skypeVoiceURLWithHandle:", *(void *)(a1 + 32));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __57__NSURL_ContactsUI___cnui_skypeVideoURLFutureWithHandle___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 40), "_cnui_skypeVideoURLWithHandle:", *(void *)(a1 + 32));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __63__NSURL_ContactsUI___cnui_messagesURLFutureWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 48), "_cnui_messagesURLWithHandle:contact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __64__NSURL_ContactsUI___cnui_messagingURLFutureWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 48), "_cnui_messagingURLWithHandle:contact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __59__NSURL_ContactsUI___cnui_mailURLFutureWithHandle_contact___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 48), "_cnui_mailURLWithHandle:contact:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __56__NSURL_ContactsUI___cnui_walletPayURLFutureWithHandle___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 40), "_cnui_walletPayURLWithHandle:", *(void *)(a1 + 32));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

id __54__NSURL_ContactsUI___cnui_expanseURLFutureWithHandle___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(*(id *)(a1 + 40), "_cnui_expanseURLWithHandle:", *(void *)(a1 + 32));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[CNContactsUIError errorWithCode:208];
    v7 = v6;
    if (a2) {
      *a2 = v6;
    }
  }
  return v4;
}

@end