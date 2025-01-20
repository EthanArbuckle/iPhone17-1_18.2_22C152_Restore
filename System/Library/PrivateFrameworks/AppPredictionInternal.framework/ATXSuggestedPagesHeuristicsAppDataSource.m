@interface ATXSuggestedPagesHeuristicsAppDataSource
- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXSuggestedPagesHeuristicsAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = 0;
  switch(a3)
  {
    case 4:
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.Home" predictionSource:@"Heuristic"];
      v39[0] = v7;
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.weather" predictionSource:@"Heuristic"];
      v39[1] = v8;
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.mobiletimer" predictionSource:@"Heuristic"];
      v39[2] = v9;
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.iBooks" predictionSource:@"Heuristic"];
      v39[3] = v10;
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.mobilenotes" predictionSource:@"Heuristic"];
      v39[4] = v11;
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.Preferences" predictionSource:@"Heuristic"];
      v39[5] = v12;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:6];

      goto LABEL_6;
    case 5:
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.Maps" predictionSource:@"Heuristic"];
      v36 = v7;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      goto LABEL_12;
    case 6:
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.Fitness" predictionSource:@"Heuristic"];
      v37[0] = v7;
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.Health" predictionSource:@"Heuristic"];
      v37[1] = v8;
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.Music" predictionSource:@"Heuristic"];
      v37[2] = v9;
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.podcasts" predictionSource:@"Heuristic"];
      v37[3] = v10;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
LABEL_6:

      goto LABEL_7;
    case 7:
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.mobilecal" predictionSource:@"Heuristic"];
      v34[0] = v7;
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.mobilenotes" predictionSource:@"Heuristic"];
      v34[1] = v33;
      v32 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.reminders" predictionSource:@"Heuristic"];
      v34[2] = v32;
      v31 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.shortcuts" predictionSource:@"Heuristic"];
      v34[3] = v31;
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.MobileAddressBook" predictionSource:@"Heuristic"];
      v34[4] = v13;
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.stocks" predictionSource:@"Heuristic"];
      v34[5] = v14;
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.DocumentsApp" predictionSource:@"Heuristic"];
      v34[6] = v15;
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.mobilemail" predictionSource:@"Heuristic"];
      v34[7] = v16;
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.Numbers" predictionSource:@"Heuristic"];
      v34[8] = v17;
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.Pages" predictionSource:@"Heuristic"];
      v34[9] = v18;
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.Keynote" predictionSource:@"Heuristic"];
      v34[10] = v19;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:11];

      goto LABEL_10;
    case 8:
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.weather" predictionSource:@"Heuristic"];
      v35[0] = v7;
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.iBooks" predictionSource:@"Heuristic"];
      v35[1] = v33;
      v32 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.tv" predictionSource:@"Heuristic"];
      v35[2] = v32;
      v31 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.Music" predictionSource:@"Heuristic"];
      v35[3] = v31;
      v30 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.podcasts" predictionSource:@"Heuristic"];
      v35[4] = v30;
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.news" predictionSource:@"Heuristic"];
      v35[5] = v20;
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.facetime" predictionSource:@"Heuristic"];
      v35[6] = v21;
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.mobileslideshow" predictionSource:@"Heuristic"];
      v35[7] = v22;
      v23 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.camera" predictionSource:@"Heuristic"];
      v35[8] = v23;
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.mobilegarageband" predictionSource:@"Heuristic"];
      v35[9] = v24;
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.iMovie" predictionSource:@"Heuristic"];
      v35[10] = v25;
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.clips" predictionSource:@"Heuristic"];
      v35[11] = v26;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:12];

LABEL_10:
      goto LABEL_12;
    case 9:
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.iBooks" predictionSource:@"Heuristic"];
      v38[0] = v7;
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.news" predictionSource:@"Heuristic"];
      v38[1] = v8;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
LABEL_7:

      goto LABEL_12;
    case 11:
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.Music" predictionSource:@"Heuristic"];
      v40[0] = v7;
      v27 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.podcasts" predictionSource:@"Heuristic"];
      v40[1] = v27;
      v28 = (void *)[objc_alloc(MEMORY[0x1E4F4B070]) initWithBundleId:@"com.apple.mobilenotes" predictionSource:@"Heuristic"];
      v40[2] = v28;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];

LABEL_12:
      break;
    default:
      break;
  }

  return v6;
}

@end