@interface MTBridgeCollectionSettingsViewController
- (MTBridgeCollectionSettingsViewController)initWithCollectionType:(unint64_t)a3 identifier:(id)a4;
- (id)_footerTextWithValue:(int64_t)a3;
- (id)_specifierNameWithValue:(int64_t)a3;
- (id)_specifierWithValue:(int64_t)a3;
- (id)specifiers;
- (int64_t)_selectedNumberOfEpisodes;
- (void)_removeShow;
- (void)_setNumberOfEpisodesWithSpecifier:(id)a3;
@end

@implementation MTBridgeCollectionSettingsViewController

- (MTBridgeCollectionSettingsViewController)initWithCollectionType:(unint64_t)a3 identifier:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MTBridgeCollectionSettingsViewController;
  v8 = [(MTBridgeCollectionSettingsViewController *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_collectionType = a3;
    objc_storeStrong((id *)&v8->_identifier, a4);
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v9 selector:"_handlePodcastsIdentifiersDidChangeNotification:" name:NMSMediaPinningManagerPodcastsIdentifiersDidChangeNotification object:0];
  }
  return v9;
}

- (id)specifiers
{
  v2 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    uint64_t v35 = OBJC_IVAR___PSListController__specifiers;
    v5 = +[NSMutableArray array];
    id v6 = [(MTBridgeCollectionSettingsViewController *)self _selectedNumberOfEpisodes];
    id v7 = +[PSSpecifier groupSpecifierWithID:@"NumberOfEpisodesGroup"];
    [v7 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v8 = [(MTBridgeCollectionSettingsViewController *)self _footerTextWithValue:v6];
    [v7 setProperty:v8 forKey:PSFooterTextGroupKey];

    v36 = v7;
    [v5 addObject:v7];
    v9 = +[NMSPodcastsDownloadSettings orderedDownloadSettings];
    v10 = +[NSMutableArray arrayWithArray:v9];

    if (self->_collectionType != 3) {
      [v10 insertObject:&off_1DB90 atIndex:0];
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v12)
    {
      id v13 = v12;
      v14 = 0;
      uint64_t v15 = *(void *)v38;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v18 = -[MTBridgeCollectionSettingsViewController _specifierWithValue:](self, "_specifierWithValue:", [v17 unsignedIntegerValue]);
          [v5 addObject:v18];
          if (v6 == [v17 unsignedIntegerValue])
          {
            id v19 = v18;

            v14 = v19;
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    [v36 setProperty:v14 forKey:PSRadioGroupCheckedSpecifierKey];
    if (self->_collectionType == 3)
    {
      v20 = +[PSSpecifier groupSpecifierWithID:@"RemoveShowGroup"];
      [v5 addObject:v20];

      v21 = +[NSBundle podcastsFoundationBundle];
      v22 = [v21 localizedStringForKey:@"REMOVE_SHOW_TEXT" value:@"Remove Show" table:0];
      v23 = +[PSConfirmationSpecifier preferenceSpecifierNamed:v22 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v23 setProperty:objc_opt_class() forKey:PSCellClassKey];
      [v23 setProperty:&off_1DBA8 forKey:PSAlignmentKey];
      [v23 setConfirmationAction:"_removeShow"];
      [v23 setProperty:&__kCFBooleanTrue forKey:PSConfirmationDestructiveKey];
      v24 = +[NSBundle podcastsFoundationBundle];
      v25 = [v24 localizedStringForKey:@"REMOVE_CONFIRMATION_TITLE" value:&stru_1CC00 table:0];
      v26 = +[NSString localizedStringWithValidatedFormat:v25, @"%ld", 0, [(MTBridgeCollectionSettingsViewController *)self _selectedNumberOfEpisodes] validFormatSpecifiers error];
      [v23 setPrompt:v26];

      v27 = +[NSBundle podcastsFoundationBundle];
      v28 = [v27 localizedStringForKey:@"REMOVE_CONFIRMATION_BUTTON" value:&stru_1CC00 table:0];
      v29 = +[NSString localizedStringWithValidatedFormat:v28, @"%ld", 0, [(MTBridgeCollectionSettingsViewController *)self _selectedNumberOfEpisodes] validFormatSpecifiers error];
      [v23 setTitle:v29];

      v30 = +[NSBundle podcastsFoundationBundle];
      v31 = [v30 localizedStringForKey:@"CANCEL_TEXT" value:@"Cancel" table:0];
      [v23 setCancelButton:v31];

      [v5 addObject:v23];
    }
    id v32 = [v5 copy];
    v33 = *(void **)&self->BPSListController_opaque[v35];
    *(void *)&self->BPSListController_opaque[v35] = v32;

    id v3 = *(id *)&self->BPSListController_opaque[v35];
  }

  return v3;
}

- (id)_specifierNameWithValue:(int64_t)a3
{
  if (a3) {
    +[MTBridgeUtilities localizedStringForEpisodeCount:](MTBridgeUtilities, "localizedStringForEpisodeCount:");
  }
  else {
  id v3 = +[MTBridgeUtilities localizedOffString];
  }

  return v3;
}

- (void)_setNumberOfEpisodesWithSpecifier:(id)a3
{
  v4 = [a3 propertyForKey:@"MTBNumberOfEpisodesKey"];
  id v5 = [v4 integerValue];

  switch(self->_collectionType)
  {
    case 0uLL:
      id v7 = [objc_alloc((Class)NMSPodcastsDownloadSettings) initWithCollectionType:0];
      [v7 setNumberOfEpisodes:v5];
      id v6 = +[NMSMediaPinningManager sharedManager];
      [v6 setPodcastsUpNextDownloadSettings:v7];
      goto LABEL_6;
    case 1uLL:
      id v7 = [objc_alloc((Class)NMSPodcastsDownloadSettings) initWithCollectionType:1];
      [v7 setNumberOfEpisodes:v5];
      id v6 = +[NMSMediaPinningManager sharedManager];
      [v6 setPodcastsSavedEpisodesDownloadSettings:v7];
      goto LABEL_6;
    case 2uLL:
      id v7 = [objc_alloc((Class)NMSPodcastsDownloadSettings) initWithCollectionType:2];
      [v7 setNumberOfEpisodes:v5];
      id v6 = +[NMSMediaPinningManager sharedManager];
      [v6 setPodcastsDownloadSettings:v7 forStationUUID:self->_identifier];
      goto LABEL_6;
    case 3uLL:
      id v7 = [objc_alloc((Class)NMSPodcastsDownloadSettings) initWithCollectionType:3];
      [v7 setNumberOfEpisodes:v5];
      id v6 = +[NMSMediaPinningManager sharedManager];
      [v6 setPodcastsDownloadSettings:v7 forShowFeedURL:self->_identifier];
LABEL_6:

      break;
    default:
      return;
  }
}

- (id)_specifierWithValue:(int64_t)a3
{
  id v5 = -[MTBridgeCollectionSettingsViewController _specifierNameWithValue:](self, "_specifierNameWithValue:");
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v6 setButtonAction:"_setNumberOfEpisodesWithSpecifier:"];
  id v7 = +[NSNumber numberWithInteger:a3];
  [v6 setProperty:v7 forKey:@"MTBNumberOfEpisodesKey"];

  return v6;
}

- (void)_removeShow
{
  id v6 = [objc_alloc((Class)NMSPodcastsDownloadSettings) initWithCollectionType:3];
  [v6 setNumberOfEpisodes:0];
  id v3 = +[NMSMediaPinningManager sharedManager];
  [v3 setPodcastsDownloadSettings:v6 forShowFeedURL:self->_identifier];

  v4 = [(MTBridgeCollectionSettingsViewController *)self navigationController];
  id v5 = [v4 popViewControllerAnimated:1];
}

- (id)_footerTextWithValue:(int64_t)a3
{
  id v5 = +[NSBundle podcastsFoundationBundle];
  id v6 = v5;
  if (a3)
  {
    id v7 = [v5 localizedStringForKey:@"NUMBER_OF_EPISODES_FOOTER_TEXT" value:&stru_1CC00 table:0];
    v8 = [(MTBridgeCollectionSettingsViewController *)self title];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, a3, v8);
  }
  else
  {
    id v7 = [v5 localizedStringForKey:@"NUMBER_OF_EPISODES_OFF_FOOTER_TEXT" value:@"Episodes from %@ won’t be downloaded." table:0];
    v8 = [(MTBridgeCollectionSettingsViewController *)self title];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v8, v11);
  v9 = };

  return v9;
}

- (int64_t)_selectedNumberOfEpisodes
{
  switch(self->_collectionType)
  {
    case 0uLL:
      id v3 = +[NMSMediaPinningManager sharedManager];
      v4 = [v3 podcastsUpNextDownloadSettings];
      goto LABEL_7;
    case 1uLL:
      id v3 = +[NMSMediaPinningManager sharedManager];
      v4 = [v3 podcastsSavedEpisodesDownloadSettings];
      goto LABEL_7;
    case 2uLL:
      id v3 = +[NMSMediaPinningManager sharedManager];
      v4 = [v3 podcastsDownloadSettingsForStationUUID:self->_identifier];
      goto LABEL_7;
    case 3uLL:
      id v3 = +[NMSMediaPinningManager sharedManager];
      v4 = [v3 podcastsDownloadSettingsForShowFeedURL:self->_identifier];
LABEL_7:
      id v6 = v4;
      id v7 = [v4 numberOfEpisodes];

      int64_t result = (int64_t)v7;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end