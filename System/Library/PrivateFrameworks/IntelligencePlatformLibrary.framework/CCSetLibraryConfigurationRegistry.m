@interface CCSetLibraryConfigurationRegistry
+ (id)allSetConfigurations;
+ (id)configurationForSetIdentifier:(id)a3;
+ (id)configurationForSet_AppCustomCarName;
+ (id)configurationForSet_AppCustomCarProfileName;
+ (id)configurationForSet_AppCustomContactGroupName;
+ (id)configurationForSet_AppCustomContactName;
+ (id)configurationForSet_AppCustomMediaAudiobookAuthorName;
+ (id)configurationForSet_AppCustomMediaAudiobookTitle;
+ (id)configurationForSet_AppCustomMediaMusicArtistName;
+ (id)configurationForSet_AppCustomMediaPlaylistTitle;
+ (id)configurationForSet_AppCustomMediaShowTitle;
+ (id)configurationForSet_AppCustomNotebookItemGroupName;
+ (id)configurationForSet_AppCustomNotebookItemTitle;
+ (id)configurationForSet_AppCustomPaymentsAccountNickname;
+ (id)configurationForSet_AppCustomPaymentsOrganizationName;
+ (id)configurationForSet_AppCustomPhotoAlbumName;
+ (id)configurationForSet_AppCustomPhotoTag;
+ (id)configurationForSet_AppCustomVoiceCommandName;
+ (id)configurationForSet_AppCustomWorkoutActivityName;
+ (id)configurationForSet_AppGlobalMediaAudiobookAuthor;
+ (id)configurationForSet_AppGlobalMediaAudiobookTitle;
+ (id)configurationForSet_AppGlobalMediaMusicArtistName;
+ (id)configurationForSet_AppGlobalMediaPlaylistTitle;
+ (id)configurationForSet_AppGlobalMediaShowTitle;
+ (id)configurationForSet_AppIntentsIndexedEntity;
+ (id)configurationForSet_AppIntentsIndexedEnum;
+ (id)configurationForSet_AppShortcutEntity;
+ (id)configurationForSet_AppShortcutPhrase;
+ (id)configurationForSet_CalendarEvent;
+ (id)configurationForSet_Contact;
+ (id)configurationForSet_FindMyDevice;
+ (id)configurationForSet_FitnessGuest;
+ (id)configurationForSet_HealthMedication;
+ (id)configurationForSet_Home;
+ (id)configurationForSet_HomeServiceArea;
+ (id)configurationForSet_InstalledApp;
+ (id)configurationForSet_Media;
+ (id)configurationForSet_PeopleSuggesterContactPrior;
+ (id)configurationForSet_PhotosPetRelationship;
+ (id)configurationForSet_Podcast;
+ (id)configurationForSet_RadioStation;
+ (id)configurationForSet_SignificantLocation;
+ (id)configurationForSet_SiriCompanionContextAudio;
+ (id)configurationForSet_SiriLearnedContact;
+ (id)configurationForSet_SiriLearnedMedia;
+ (id)configurationForSet_ToolKitToolDefinition;
+ (id)configurationForSet_UserAccountIdentity;
+ (id)configurationForSet_WalletPass;
+ (id)syncPolicyForSet_AppCustomCarName;
+ (id)syncPolicyForSet_AppCustomCarProfileName;
+ (id)syncPolicyForSet_AppCustomContactGroupName;
+ (id)syncPolicyForSet_AppCustomContactName;
+ (id)syncPolicyForSet_AppCustomMediaAudiobookAuthorName;
+ (id)syncPolicyForSet_AppCustomMediaAudiobookTitle;
+ (id)syncPolicyForSet_AppCustomMediaMusicArtistName;
+ (id)syncPolicyForSet_AppCustomMediaPlaylistTitle;
+ (id)syncPolicyForSet_AppCustomMediaShowTitle;
+ (id)syncPolicyForSet_AppCustomNotebookItemGroupName;
+ (id)syncPolicyForSet_AppCustomNotebookItemTitle;
+ (id)syncPolicyForSet_AppCustomPaymentsAccountNickname;
+ (id)syncPolicyForSet_AppCustomPaymentsOrganizationName;
+ (id)syncPolicyForSet_AppCustomPhotoAlbumName;
+ (id)syncPolicyForSet_AppCustomPhotoTag;
+ (id)syncPolicyForSet_AppCustomVoiceCommandName;
+ (id)syncPolicyForSet_AppCustomWorkoutActivityName;
+ (id)syncPolicyForSet_AppGlobalMediaAudiobookAuthor;
+ (id)syncPolicyForSet_AppGlobalMediaAudiobookTitle;
+ (id)syncPolicyForSet_AppGlobalMediaMusicArtistName;
+ (id)syncPolicyForSet_AppGlobalMediaPlaylistTitle;
+ (id)syncPolicyForSet_AppGlobalMediaShowTitle;
+ (id)syncPolicyForSet_AppIntentsIndexedEntity;
+ (id)syncPolicyForSet_AppIntentsIndexedEnum;
+ (id)syncPolicyForSet_AppShortcutEntity;
+ (id)syncPolicyForSet_AppShortcutPhrase;
+ (id)syncPolicyForSet_CalendarEvent;
+ (id)syncPolicyForSet_Contact;
+ (id)syncPolicyForSet_FindMyDevice;
+ (id)syncPolicyForSet_FitnessGuest;
+ (id)syncPolicyForSet_HealthMedication;
+ (id)syncPolicyForSet_Home;
+ (id)syncPolicyForSet_HomeServiceArea;
+ (id)syncPolicyForSet_InstalledApp;
+ (id)syncPolicyForSet_Media;
+ (id)syncPolicyForSet_PeopleSuggesterContactPrior;
+ (id)syncPolicyForSet_PhotosPetRelationship;
+ (id)syncPolicyForSet_Podcast;
+ (id)syncPolicyForSet_RadioStation;
+ (id)syncPolicyForSet_SignificantLocation;
+ (id)syncPolicyForSet_SiriCompanionContextAudio;
+ (id)syncPolicyForSet_SiriLearnedContact;
+ (id)syncPolicyForSet_SiriLearnedMedia;
+ (id)syncPolicyForSet_ToolKitToolDefinition;
+ (id)syncPolicyForSet_UserAccountIdentity;
+ (id)syncPolicyForSet_WalletPass;
@end

@implementation CCSetLibraryConfigurationRegistry

+ (id)allSetConfigurations
{
  v51[46] = *MEMORY[0x263EF8340];
  v50 = objc_msgSend(a1, "configurationForSet_AppCustomCarName");
  v51[0] = v50;
  v49 = objc_msgSend(a1, "configurationForSet_AppCustomCarProfileName");
  v51[1] = v49;
  v48 = objc_msgSend(a1, "configurationForSet_AppCustomContactGroupName");
  v51[2] = v48;
  v47 = objc_msgSend(a1, "configurationForSet_AppCustomContactName");
  v51[3] = v47;
  v46 = objc_msgSend(a1, "configurationForSet_AppCustomMediaAudiobookAuthorName");
  v51[4] = v46;
  v45 = objc_msgSend(a1, "configurationForSet_AppCustomMediaAudiobookTitle");
  v51[5] = v45;
  v44 = objc_msgSend(a1, "configurationForSet_AppCustomMediaMusicArtistName");
  v51[6] = v44;
  v43 = objc_msgSend(a1, "configurationForSet_AppCustomMediaPlaylistTitle");
  v51[7] = v43;
  v42 = objc_msgSend(a1, "configurationForSet_AppCustomMediaShowTitle");
  v51[8] = v42;
  v41 = objc_msgSend(a1, "configurationForSet_AppCustomNotebookItemGroupName");
  v51[9] = v41;
  v40 = objc_msgSend(a1, "configurationForSet_AppCustomNotebookItemTitle");
  v51[10] = v40;
  v39 = objc_msgSend(a1, "configurationForSet_AppCustomPaymentsAccountNickname");
  v51[11] = v39;
  v38 = objc_msgSend(a1, "configurationForSet_AppCustomPaymentsOrganizationName");
  v51[12] = v38;
  v37 = objc_msgSend(a1, "configurationForSet_AppCustomPhotoAlbumName");
  v51[13] = v37;
  v36 = objc_msgSend(a1, "configurationForSet_AppCustomPhotoTag");
  v51[14] = v36;
  v35 = objc_msgSend(a1, "configurationForSet_AppCustomVoiceCommandName");
  v51[15] = v35;
  v34 = objc_msgSend(a1, "configurationForSet_AppCustomWorkoutActivityName");
  v51[16] = v34;
  v33 = objc_msgSend(a1, "configurationForSet_AppGlobalMediaAudiobookAuthor");
  v51[17] = v33;
  v32 = objc_msgSend(a1, "configurationForSet_AppGlobalMediaAudiobookTitle");
  v51[18] = v32;
  v31 = objc_msgSend(a1, "configurationForSet_AppGlobalMediaMusicArtistName");
  v51[19] = v31;
  v30 = objc_msgSend(a1, "configurationForSet_AppGlobalMediaPlaylistTitle");
  v51[20] = v30;
  v29 = objc_msgSend(a1, "configurationForSet_AppGlobalMediaShowTitle");
  v51[21] = v29;
  v28 = objc_msgSend(a1, "configurationForSet_AppIntentsIndexedEntity");
  v51[22] = v28;
  v27 = objc_msgSend(a1, "configurationForSet_AppIntentsIndexedEnum");
  v51[23] = v27;
  v26 = objc_msgSend(a1, "configurationForSet_AppShortcutEntity");
  v51[24] = v26;
  v25 = objc_msgSend(a1, "configurationForSet_AppShortcutPhrase");
  v51[25] = v25;
  v24 = objc_msgSend(a1, "configurationForSet_CalendarEvent");
  v51[26] = v24;
  v23 = objc_msgSend(a1, "configurationForSet_Contact");
  v51[27] = v23;
  v22 = objc_msgSend(a1, "configurationForSet_FindMyDevice");
  v51[28] = v22;
  v21 = objc_msgSend(a1, "configurationForSet_FitnessGuest");
  v51[29] = v21;
  v20 = objc_msgSend(a1, "configurationForSet_HealthMedication");
  v51[30] = v20;
  v19 = objc_msgSend(a1, "configurationForSet_Home");
  v51[31] = v19;
  v18 = objc_msgSend(a1, "configurationForSet_HomeServiceArea");
  v51[32] = v18;
  v17 = objc_msgSend(a1, "configurationForSet_InstalledApp");
  v51[33] = v17;
  v16 = objc_msgSend(a1, "configurationForSet_Media");
  v51[34] = v16;
  v15 = objc_msgSend(a1, "configurationForSet_PeopleSuggesterContactPrior");
  v51[35] = v15;
  v3 = objc_msgSend(a1, "configurationForSet_PhotosPetRelationship");
  v51[36] = v3;
  v4 = objc_msgSend(a1, "configurationForSet_Podcast");
  v51[37] = v4;
  v5 = objc_msgSend(a1, "configurationForSet_RadioStation");
  v51[38] = v5;
  v6 = objc_msgSend(a1, "configurationForSet_SignificantLocation");
  v51[39] = v6;
  v7 = objc_msgSend(a1, "configurationForSet_SiriCompanionContextAudio");
  v51[40] = v7;
  v8 = objc_msgSend(a1, "configurationForSet_SiriLearnedContact");
  v51[41] = v8;
  v9 = objc_msgSend(a1, "configurationForSet_SiriLearnedMedia");
  v51[42] = v9;
  v10 = objc_msgSend(a1, "configurationForSet_ToolKitToolDefinition");
  v51[43] = v10;
  v11 = objc_msgSend(a1, "configurationForSet_UserAccountIdentity");
  v51[44] = v11;
  v12 = objc_msgSend(a1, "configurationForSet_WalletPass");
  v51[45] = v12;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:46];

  return v14;
}

+ (id)configurationForSetIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomCarName"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomCarName");
LABEL_93:
    v6 = (void *)v5;
    goto LABEL_94;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomCarProfileName"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomCarProfileName");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomContactGroupName"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomContactGroupName");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomContactName"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomContactName");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomMediaAudiobookAuthorName"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomMediaAudiobookAuthorName");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomMediaAudiobookTitle"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomMediaAudiobookTitle");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomMediaMusicArtistName"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomMediaMusicArtistName");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomMediaPlaylistTitle"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomMediaPlaylistTitle");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomMediaShowTitle"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomMediaShowTitle");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomNotebookItemGroupName"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomNotebookItemGroupName");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomNotebookItemTitle"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomNotebookItemTitle");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomPaymentsAccountNickname"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomPaymentsAccountNickname");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomPaymentsOrganizationName"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomPaymentsOrganizationName");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomPhotoAlbumName"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomPhotoAlbumName");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomPhotoTag"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomPhotoTag");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomVoiceCommandName"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomVoiceCommandName");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.CustomWorkoutActivityName"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppCustomWorkoutActivityName");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.GlobalMediaAudiobookAuthor"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppGlobalMediaAudiobookAuthor");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.GlobalMediaAudiobookTitle"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppGlobalMediaAudiobookTitle");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.GlobalMediaMusicArtistName"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppGlobalMediaMusicArtistName");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.GlobalMediaPlaylistTitle"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppGlobalMediaPlaylistTitle");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.IntentVocabulary.GlobalMediaShowTitle"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppGlobalMediaShowTitle");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.Intents.IndexedEntity"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppIntentsIndexedEntity");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.Intents.IndexedEnum"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppIntentsIndexedEnum");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.Shortcut.Entity"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppShortcutEntity");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.Shortcut.Phrase"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_AppShortcutPhrase");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"Calendar.Event"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_CalendarEvent");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"Contacts.Contact"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_Contact");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"FindMy.Device"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_FindMyDevice");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"Fitness.Guest"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_FitnessGuest");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"Health.Medication"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_HealthMedication");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"HomeKit.Home"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_Home");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"HomeKit.HomeServiceArea"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_HomeServiceArea");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"App.InstalledApp"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_InstalledApp");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"MediaLibrary.Media"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_Media");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"PeopleSuggester.ContactPrior"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_PeopleSuggesterContactPrior");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"Photos.PetRelationship"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_PhotosPetRelationship");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"Podcasts.Podcast"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_Podcast");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"CarPlay.RadioStation"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_RadioStation");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"Location.SignificantLocation"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_SignificantLocation");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"Siri.CompanionContext.Audio"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_SiriCompanionContextAudio");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"Siri.PrivateLearning.Contact"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_SiriLearnedContact");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"Siri.PrivateLearning.Media"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_SiriLearnedMedia");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"ToolKitToolDefinition"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_ToolKitToolDefinition");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"UserAccount.Identity"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_UserAccountIdentity");
    goto LABEL_93;
  }
  if ([v4 isEqualToString:@"Wallet.Pass"])
  {
    uint64_t v5 = objc_msgSend(a1, "configurationForSet_WalletPass");
    goto LABEL_93;
  }
  v6 = 0;
LABEL_94:

  return v6;
}

+ (id)configurationForSet_WalletPass
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_WalletPass");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"9F5CD5E5-7B47-4D00-9C37-F1B6A0A54348"];
  v7 = (void *)[v5 initWithSetIdentifier:@"Wallet.Pass" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_WalletPass
{
  return 0;
}

+ (id)configurationForSet_UserAccountIdentity
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_UserAccountIdentity");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"A397B588-ECB0-492D-9081-1BD6A6C89258"];
  v7 = (void *)[v5 initWithSetIdentifier:@"UserAccount.Identity" setUUID:v6 resourceDomain:1 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_UserAccountIdentity
{
  return 0;
}

+ (id)configurationForSet_ToolKitToolDefinition
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_ToolKitToolDefinition");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"9A6207E7-E36E-4477-94B2-CDA2A744F94E"];
  v7 = (void *)[v5 initWithSetIdentifier:@"ToolKitToolDefinition" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_ToolKitToolDefinition
{
  return 0;
}

+ (id)configurationForSet_SiriLearnedMedia
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_SiriLearnedMedia");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0ED4EA3B-1D63-4D6D-B40B-4DE4C650176A"];
  v7 = (void *)[v5 initWithSetIdentifier:@"Siri.PrivateLearning.Media" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_SiriLearnedMedia
{
  return 0;
}

+ (id)configurationForSet_SiriLearnedContact
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_SiriLearnedContact");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"391C69C7-2DAA-4641-9760-032767E8BCA7"];
  v7 = (void *)[v5 initWithSetIdentifier:@"Siri.PrivateLearning.Contact" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_SiriLearnedContact
{
  return 0;
}

+ (id)configurationForSet_SiriCompanionContextAudio
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_SiriCompanionContextAudio");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"234B44F4-7E93-45AF-928C-3CADFB167AC7"];
  v7 = (void *)[v5 initWithSetIdentifier:@"Siri.CompanionContext.Audio" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_SiriCompanionContextAudio
{
  return 0;
}

+ (id)configurationForSet_SignificantLocation
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_SignificantLocation");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"B603F574-65F6-4E08-B2A9-056AD07A3273"];
  v7 = (void *)[v5 initWithSetIdentifier:@"Location.SignificantLocation" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_SignificantLocation
{
  return 0;
}

+ (id)configurationForSet_RadioStation
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_RadioStation");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"8142DC35-A0AF-4467-ACB7-D9E422302981"];
  v7 = (void *)[v5 initWithSetIdentifier:@"CarPlay.RadioStation" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_RadioStation
{
  return 0;
}

+ (id)configurationForSet_Podcast
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_Podcast");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"61008964-523B-438A-B47F-5323C06957AC"];
  v7 = (void *)[v5 initWithSetIdentifier:@"Podcasts.Podcast" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_Podcast
{
  return 0;
}

+ (id)configurationForSet_PhotosPetRelationship
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_PhotosPetRelationship");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"A334B4F6-B901-4EF2-93EF-8D5889416CDE"];
  v7 = (void *)[v5 initWithSetIdentifier:@"Photos.PetRelationship" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_PhotosPetRelationship
{
  return 0;
}

+ (id)configurationForSet_PeopleSuggesterContactPrior
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_PeopleSuggesterContactPrior");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"F156A4A4-16E3-42A5-A0D1-F5AE4DFC5331"];
  v7 = (void *)[v5 initWithSetIdentifier:@"PeopleSuggester.ContactPrior" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_PeopleSuggesterContactPrior
{
  return 0;
}

+ (id)configurationForSet_Media
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_Media");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E4B169CE-F480-47A0-ABE6-4DAB491C274F"];
  v7 = (void *)[v5 initWithSetIdentifier:@"MediaLibrary.Media" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_Media
{
  return 0;
}

+ (id)configurationForSet_InstalledApp
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_InstalledApp");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6B1DFDA5-9541-4968-A29C-21C43C2F24A1"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.InstalledApp" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_InstalledApp
{
  return 0;
}

+ (id)configurationForSet_HomeServiceArea
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_HomeServiceArea");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"8B88A30C-DD2E-4E41-B396-40AE9E55FE65"];
  v7 = (void *)[v5 initWithSetIdentifier:@"HomeKit.HomeServiceArea" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_HomeServiceArea
{
  return 0;
}

+ (id)configurationForSet_Home
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_Home");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"833A9F62-C604-424E-9A09-0767C6796FAB"];
  v7 = (void *)[v5 initWithSetIdentifier:@"HomeKit.Home" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_Home
{
  return 0;
}

+ (id)configurationForSet_HealthMedication
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_HealthMedication");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"9F4D5490-5BB3-46A8-A265-088CC9C8F8A6"];
  v7 = (void *)[v5 initWithSetIdentifier:@"Health.Medication" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_HealthMedication
{
  return 0;
}

+ (id)configurationForSet_FitnessGuest
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_FitnessGuest");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"39776DD9-A42B-4D79-AA64-B284650454F6"];
  v7 = (void *)[v5 initWithSetIdentifier:@"Fitness.Guest" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_FitnessGuest
{
  return 0;
}

+ (id)configurationForSet_FindMyDevice
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_FindMyDevice");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"57A14EA7-BA70-45DA-9BFC-F3C92D2EA420"];
  v7 = (void *)[v5 initWithSetIdentifier:@"FindMy.Device" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_FindMyDevice
{
  return 0;
}

+ (id)configurationForSet_Contact
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_Contact");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"745FF29D-780C-48FF-BDEA-4B1AFB78612F"];
  v7 = (void *)[v5 initWithSetIdentifier:@"Contacts.Contact" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_Contact
{
  return 0;
}

+ (id)configurationForSet_CalendarEvent
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_CalendarEvent");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"4110F1E5-1389-4EA3-B197-AF72BECC7C77"];
  v7 = (void *)[v5 initWithSetIdentifier:@"Calendar.Event" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_CalendarEvent
{
  return 0;
}

+ (id)configurationForSet_AppShortcutPhrase
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppShortcutPhrase");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"312175FB-7684-42B9-8BEF-E387FF9E7C2E"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.Shortcut.Phrase" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppShortcutPhrase
{
  return 0;
}

+ (id)configurationForSet_AppShortcutEntity
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppShortcutEntity");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"08EE978B-4129-48DD-A8EC-DE35871276EC"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.Shortcut.Entity" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppShortcutEntity
{
  return 0;
}

+ (id)configurationForSet_AppIntentsIndexedEnum
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppIntentsIndexedEnum");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"4D8E120F-B415-4A24-9C49-4EF2628D8659"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.Intents.IndexedEnum" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppIntentsIndexedEnum
{
  return 0;
}

+ (id)configurationForSet_AppIntentsIndexedEntity
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppIntentsIndexedEntity");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"19F5F0B4-588B-4E82-A4F8-7A862371992F"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.Intents.IndexedEntity" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppIntentsIndexedEntity
{
  return 0;
}

+ (id)configurationForSet_AppGlobalMediaShowTitle
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppGlobalMediaShowTitle");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BAF75B38-2E33-47AD-9CA9-0B313DFC186E"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.GlobalMediaShowTitle" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppGlobalMediaShowTitle
{
  return 0;
}

+ (id)configurationForSet_AppGlobalMediaPlaylistTitle
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppGlobalMediaPlaylistTitle");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0E25E7CB-44D0-4C4A-95B3-281BA4570001"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.GlobalMediaPlaylistTitle" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppGlobalMediaPlaylistTitle
{
  return 0;
}

+ (id)configurationForSet_AppGlobalMediaMusicArtistName
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppGlobalMediaMusicArtistName");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"ADF6CBBD-8BB6-434F-9850-1A35E60C6B41"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.GlobalMediaMusicArtistName" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppGlobalMediaMusicArtistName
{
  return 0;
}

+ (id)configurationForSet_AppGlobalMediaAudiobookTitle
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppGlobalMediaAudiobookTitle");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"B54F7718-DD7E-4920-9B93-64D4D9B2B536"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.GlobalMediaAudiobookTitle" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppGlobalMediaAudiobookTitle
{
  return 0;
}

+ (id)configurationForSet_AppGlobalMediaAudiobookAuthor
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppGlobalMediaAudiobookAuthor");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"FEDDC5F8-0866-4FD2-9410-B0D9AA6CA7D5"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.GlobalMediaAudiobookAuthor" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppGlobalMediaAudiobookAuthor
{
  return 0;
}

+ (id)configurationForSet_AppCustomWorkoutActivityName
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomWorkoutActivityName");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"365A5F47-42E6-4854-8309-C6DF23215189"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomWorkoutActivityName" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomWorkoutActivityName
{
  return 0;
}

+ (id)configurationForSet_AppCustomVoiceCommandName
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomVoiceCommandName");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"2B6976B5-1710-40C5-9EBA-284991364DC7"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomVoiceCommandName" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomVoiceCommandName
{
  return 0;
}

+ (id)configurationForSet_AppCustomPhotoTag
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomPhotoTag");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"4C893C2E-6546-4F2B-B1F2-64DA7E0A2627"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomPhotoTag" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomPhotoTag
{
  return 0;
}

+ (id)configurationForSet_AppCustomPhotoAlbumName
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomPhotoAlbumName");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"D8D7DA0E-1FD2-4944-9CAB-A4D1E844B61E"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomPhotoAlbumName" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomPhotoAlbumName
{
  return 0;
}

+ (id)configurationForSet_AppCustomPaymentsOrganizationName
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomPaymentsOrganizationName");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"C239781D-3CD1-40AE-B1E7-D34CEF0E31A1"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomPaymentsOrganizationName" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomPaymentsOrganizationName
{
  return 0;
}

+ (id)configurationForSet_AppCustomPaymentsAccountNickname
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomPaymentsAccountNickname");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"502DF447-04D1-48FA-8170-65E89C7A76DC"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomPaymentsAccountNickname" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomPaymentsAccountNickname
{
  return 0;
}

+ (id)configurationForSet_AppCustomNotebookItemTitle
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomNotebookItemTitle");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BE90AE00-EF6C-4A49-B83A-1F66AB750F79"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomNotebookItemTitle" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomNotebookItemTitle
{
  return 0;
}

+ (id)configurationForSet_AppCustomNotebookItemGroupName
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomNotebookItemGroupName");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"AFC3F15C-0E4A-4342-BF83-7857BDE1315F"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomNotebookItemGroupName" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomNotebookItemGroupName
{
  return 0;
}

+ (id)configurationForSet_AppCustomMediaShowTitle
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomMediaShowTitle");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6566058D-6CF0-4EF1-B0DB-D3E40775D107"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomMediaShowTitle" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomMediaShowTitle
{
  return 0;
}

+ (id)configurationForSet_AppCustomMediaPlaylistTitle
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomMediaPlaylistTitle");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"C4F177E0-6234-4420-8CD2-0EBAA6D4AF50"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomMediaPlaylistTitle" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomMediaPlaylistTitle
{
  return 0;
}

+ (id)configurationForSet_AppCustomMediaMusicArtistName
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomMediaMusicArtistName");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"C76153F0-2C18-4D84-B8DC-A86647E3F7D9"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomMediaMusicArtistName" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomMediaMusicArtistName
{
  return 0;
}

+ (id)configurationForSet_AppCustomMediaAudiobookTitle
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomMediaAudiobookTitle");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"B2A08B70-9F0C-4531-B3E8-32F93F81AD3F"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomMediaAudiobookTitle" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomMediaAudiobookTitle
{
  return 0;
}

+ (id)configurationForSet_AppCustomMediaAudiobookAuthorName
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomMediaAudiobookAuthorName");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"6C81A729-C6AD-4B8A-8963-F86CEDE299CE"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomMediaAudiobookAuthorName" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomMediaAudiobookAuthorName
{
  return 0;
}

+ (id)configurationForSet_AppCustomContactName
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomContactName");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"DE45D7CE-E9E5-4791-8FAD-CA21FE471978"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomContactName" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomContactName
{
  return 0;
}

+ (id)configurationForSet_AppCustomContactGroupName
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomContactGroupName");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"5CBCE078-779F-47CB-957B-DCE9101FA584"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomContactGroupName" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomContactGroupName
{
  return 0;
}

+ (id)configurationForSet_AppCustomCarProfileName
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomCarProfileName");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"40C3946D-FC0E-4B0C-8B13-A68BB938A00C"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomCarProfileName" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomCarProfileName
{
  return 0;
}

+ (id)configurationForSet_AppCustomCarName
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(a1, "syncPolicyForSet_AppCustomCarName");
  id v5 = objc_alloc(MEMORY[0x263F31790]);
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"49BBB10D-0021-4E13-8FB5-362C907D95D4"];
  v7 = (void *)[v5 initWithSetIdentifier:@"App.IntentVocabulary.CustomCarName" setUUID:v6 resourceDomain:0 configuredDescriptors:v3 syncPolicy:v4];

  return v7;
}

+ (id)syncPolicyForSet_AppCustomCarName
{
  return 0;
}

@end