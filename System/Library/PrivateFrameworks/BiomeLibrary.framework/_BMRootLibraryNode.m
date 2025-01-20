@interface _BMRootLibraryNode
+ (id)Accessibility;
+ (id)Activity;
+ (id)ActivityScheduler;
+ (id)AdPlatforms;
+ (id)AeroML;
+ (id)AirPlay;
+ (id)App;
+ (id)AppleID;
+ (id)Audio;
+ (id)Autonaming;
+ (id)Calendar;
+ (id)CameraCapture;
+ (id)CarPlay;
+ (id)Carousel;
+ (id)Clock;
+ (id)CommCenter;
+ (id)ContextSync;
+ (id)ContextualUnderstanding;
+ (id)Device;
+ (id)Dictation;
+ (id)Discoverability;
+ (id)Emoji;
+ (id)Family;
+ (id)Feedback;
+ (id)FindMy;
+ (id)FrontBoard;
+ (id)GameCenter;
+ (id)GameController;
+ (id)GenerativeExperiences;
+ (id)Health;
+ (id)HomeKit;
+ (id)HumanUnderstanding;
+ (id)IntelligenceEngine;
+ (id)IntelligenceFlow;
+ (id)IntelligencePlatform;
+ (id)Keyboard;
+ (id)LifeEvent;
+ (id)Lighthouse;
+ (id)Location;
+ (id)MLSE;
+ (id)Mail;
+ (id)Maps;
+ (id)MapsShare;
+ (id)Media;
+ (id)MediaAnalysis;
+ (id)MediaRemote;
+ (id)Messages;
+ (id)Mindfulness;
+ (id)Moments;
+ (id)Motion;
+ (id)NanoSettings;
+ (id)Notification;
+ (id)OSAnalytics;
+ (id)OasisAnalytics;
+ (id)PeopleSuggester;
+ (id)PersonalizedSensing;
+ (id)Photos;
+ (id)Portrait;
+ (id)PrivateCloudCompute;
+ (id)ProactiveHarvesting;
+ (id)Reminders;
+ (id)Safari;
+ (id)Sage;
+ (id)SchoolTime;
+ (id)Screen;
+ (id)ScreenTime;
+ (id)SensitiveContentAnalysis;
+ (id)SharePlay;
+ (id)ShareSheet;
+ (id)Siri;
+ (id)Sleep;
+ (id)SoundAnalysis;
+ (id)SpringBoard;
+ (id)SystemSettings;
+ (id)Text;
+ (id)TextUnderstanding;
+ (id)Trial;
+ (id)UniversalRecents;
+ (id)UserFocus;
+ (id)Wallet;
+ (id)WalletPaymentsCommerce;
+ (id)Watch;
+ (id)Widgets;
+ (id)iCloud;
+ (id)identifier;
+ (id)streamNames;
+ (id)streamWithName:(id)a3;
+ (id)sublibraries;
+ (id)validKeyPaths;
@end

@implementation _BMRootLibraryNode

+ (id)sublibraries
{
  v89[90] = *MEMORY[0x1E4F143B8];
  v88 = [a1 Accessibility];
  v89[0] = v88;
  v87 = [a1 Activity];
  v89[1] = v87;
  v86 = [a1 ActivityScheduler];
  v89[2] = v86;
  v85 = [a1 AdPlatforms];
  v89[3] = v85;
  v84 = [a1 AeroML];
  v89[4] = v84;
  v83 = [a1 AirPlay];
  v89[5] = v83;
  v82 = [a1 App];
  v89[6] = v82;
  v81 = [a1 AppleID];
  v89[7] = v81;
  v80 = [a1 Audio];
  v89[8] = v80;
  v79 = [a1 Autonaming];
  v89[9] = v79;
  v78 = [a1 Calendar];
  v89[10] = v78;
  v77 = [a1 CameraCapture];
  v89[11] = v77;
  v76 = [a1 Carousel];
  v89[12] = v76;
  v75 = [a1 CarPlay];
  v89[13] = v75;
  v74 = [a1 Clock];
  v89[14] = v74;
  v73 = [a1 CommCenter];
  v89[15] = v73;
  v72 = [a1 ContextSync];
  v89[16] = v72;
  v71 = [a1 ContextualUnderstanding];
  v89[17] = v71;
  v70 = [a1 Device];
  v89[18] = v70;
  v69 = [a1 Dictation];
  v89[19] = v69;
  v68 = [a1 Discoverability];
  v89[20] = v68;
  v67 = [a1 Emoji];
  v89[21] = v67;
  v66 = [a1 Family];
  v89[22] = v66;
  v65 = [a1 Feedback];
  v89[23] = v65;
  v64 = [a1 FindMy];
  v89[24] = v64;
  v63 = [a1 FrontBoard];
  v89[25] = v63;
  v62 = [a1 GameCenter];
  v89[26] = v62;
  v61 = [a1 GameController];
  v89[27] = v61;
  v60 = [a1 GenerativeExperiences];
  v89[28] = v60;
  v59 = [a1 Health];
  v89[29] = v59;
  v58 = [a1 HomeKit];
  v89[30] = v58;
  v57 = [a1 HumanUnderstanding];
  v89[31] = v57;
  v56 = [a1 iCloud];
  v89[32] = v56;
  v55 = [a1 IntelligenceEngine];
  v89[33] = v55;
  v54 = [a1 IntelligenceFlow];
  v89[34] = v54;
  v53 = [a1 IntelligencePlatform];
  v89[35] = v53;
  v52 = [a1 Keyboard];
  v89[36] = v52;
  v51 = [a1 LifeEvent];
  v89[37] = v51;
  v50 = [a1 Lighthouse];
  v89[38] = v50;
  v49 = [a1 Location];
  v89[39] = v49;
  v48 = [a1 Mail];
  v89[40] = v48;
  v47 = [a1 Maps];
  v89[41] = v47;
  v46 = [a1 MapsShare];
  v89[42] = v46;
  v45 = [a1 Media];
  v89[43] = v45;
  v44 = [a1 MediaAnalysis];
  v89[44] = v44;
  v43 = [a1 MediaRemote];
  v89[45] = v43;
  v42 = [a1 Messages];
  v89[46] = v42;
  v41 = [a1 Mindfulness];
  v89[47] = v41;
  v40 = [a1 MLSE];
  v89[48] = v40;
  v39 = [a1 Moments];
  v89[49] = v39;
  v38 = [a1 Motion];
  v89[50] = v38;
  v37 = [a1 NanoSettings];
  v89[51] = v37;
  v36 = [a1 Notification];
  v89[52] = v36;
  v35 = [a1 OasisAnalytics];
  v89[53] = v35;
  v34 = [a1 OSAnalytics];
  v89[54] = v34;
  v33 = [a1 PeopleSuggester];
  v89[55] = v33;
  v32 = [a1 PersonalizedSensing];
  v89[56] = v32;
  v31 = [a1 Photos];
  v89[57] = v31;
  v30 = [a1 Portrait];
  v89[58] = v30;
  v29 = [a1 PrivateCloudCompute];
  v89[59] = v29;
  v28 = [a1 ProactiveHarvesting];
  v89[60] = v28;
  v27 = [a1 Reminders];
  v89[61] = v27;
  v26 = [a1 Safari];
  v89[62] = v26;
  v25 = [a1 Sage];
  v89[63] = v25;
  v24 = [a1 SchoolTime];
  v89[64] = v24;
  v23 = [a1 Screen];
  v89[65] = v23;
  v22 = [a1 ScreenTime];
  v89[66] = v22;
  v21 = [a1 SensitiveContentAnalysis];
  v89[67] = v21;
  v20 = [a1 SharePlay];
  v89[68] = v20;
  v19 = [a1 ShareSheet];
  v89[69] = v19;
  v18 = [a1 Siri];
  v89[70] = v18;
  v17 = [a1 Sleep];
  v89[71] = v17;
  v16 = [a1 SoundAnalysis];
  v89[72] = v16;
  v15 = [a1 SpringBoard];
  v89[73] = v15;
  v3 = [a1 SystemSettings];
  v89[74] = v3;
  v4 = [a1 Text];
  v89[75] = v4;
  v5 = [a1 TextUnderstanding];
  v89[76] = v5;
  v6 = [a1 Trial];
  v89[77] = v6;
  v7 = [a1 UniversalRecents];
  v89[78] = v7;
  v8 = [a1 UserFocus];
  v89[79] = v8;
  v9 = [a1 Wallet];
  v89[80] = v9;
  v10 = [a1 WalletPaymentsCommerce];
  v89[81] = v10;
  v11 = [a1 Watch];
  v89[82] = v11;
  v12 = [a1 Widgets];
  v89[83] = v12;
  v89[84] = objc_opt_class();
  v89[85] = objc_opt_class();
  v89[86] = objc_opt_class();
  v89[87] = objc_opt_class();
  v89[88] = objc_opt_class();
  v89[89] = objc_opt_class();
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:90];

  return v14;
}

+ (id)Device
{
  return (id)objc_opt_class();
}

+ (id)Maps
{
  return (id)objc_opt_class();
}

+ (id)FindMy
{
  return (id)objc_opt_class();
}

+ (id)UserFocus
{
  return (id)objc_opt_class();
}

+ (id)HomeKit
{
  return (id)objc_opt_class();
}

+ (id)Messages
{
  return (id)objc_opt_class();
}

+ (id)Discoverability
{
  return (id)objc_opt_class();
}

+ (id)iCloud
{
  return (id)objc_opt_class();
}

+ (id)Widgets
{
  return (id)objc_opt_class();
}

+ (id)Watch
{
  return (id)objc_opt_class();
}

+ (id)Wallet
{
  return (id)objc_opt_class();
}

+ (id)WalletPaymentsCommerce
{
  return (id)objc_opt_class();
}

+ (id)UniversalRecents
{
  return (id)objc_opt_class();
}

+ (id)Trial
{
  return (id)objc_opt_class();
}

+ (id)Text
{
  return (id)objc_opt_class();
}

+ (id)TextUnderstanding
{
  return (id)objc_opt_class();
}

+ (id)SystemSettings
{
  return (id)objc_opt_class();
}

+ (id)SpringBoard
{
  return (id)objc_opt_class();
}

+ (id)SoundAnalysis
{
  return (id)objc_opt_class();
}

+ (id)Sleep
{
  return (id)objc_opt_class();
}

+ (id)Siri
{
  return (id)objc_opt_class();
}

+ (id)ShareSheet
{
  return (id)objc_opt_class();
}

+ (id)SharePlay
{
  return (id)objc_opt_class();
}

+ (id)SensitiveContentAnalysis
{
  return (id)objc_opt_class();
}

+ (id)Screen
{
  return (id)objc_opt_class();
}

+ (id)ScreenTime
{
  return (id)objc_opt_class();
}

+ (id)SchoolTime
{
  return (id)objc_opt_class();
}

+ (id)Sage
{
  return (id)objc_opt_class();
}

+ (id)Safari
{
  return (id)objc_opt_class();
}

+ (id)Reminders
{
  return (id)objc_opt_class();
}

+ (id)ProactiveHarvesting
{
  return (id)objc_opt_class();
}

+ (id)PrivateCloudCompute
{
  return (id)objc_opt_class();
}

+ (id)Portrait
{
  return (id)objc_opt_class();
}

+ (id)Photos
{
  return (id)objc_opt_class();
}

+ (id)PersonalizedSensing
{
  return (id)objc_opt_class();
}

+ (id)PeopleSuggester
{
  return (id)objc_opt_class();
}

+ (id)OasisAnalytics
{
  return (id)objc_opt_class();
}

+ (id)OSAnalytics
{
  return (id)objc_opt_class();
}

+ (id)Notification
{
  return (id)objc_opt_class();
}

+ (id)NanoSettings
{
  return (id)objc_opt_class();
}

+ (id)Motion
{
  return (id)objc_opt_class();
}

+ (id)Moments
{
  return (id)objc_opt_class();
}

+ (id)Mindfulness
{
  return (id)objc_opt_class();
}

+ (id)Media
{
  return (id)objc_opt_class();
}

+ (id)MediaRemote
{
  return (id)objc_opt_class();
}

+ (id)MediaAnalysis
{
  return (id)objc_opt_class();
}

+ (id)MapsShare
{
  return (id)objc_opt_class();
}

+ (id)Mail
{
  return (id)objc_opt_class();
}

+ (id)MLSE
{
  return (id)objc_opt_class();
}

+ (id)Location
{
  return (id)objc_opt_class();
}

+ (id)Lighthouse
{
  return (id)objc_opt_class();
}

+ (id)LifeEvent
{
  return (id)objc_opt_class();
}

+ (id)Keyboard
{
  return (id)objc_opt_class();
}

+ (id)IntelligencePlatform
{
  return (id)objc_opt_class();
}

+ (id)IntelligenceFlow
{
  return (id)objc_opt_class();
}

+ (id)IntelligenceEngine
{
  return (id)objc_opt_class();
}

+ (id)HumanUnderstanding
{
  return (id)objc_opt_class();
}

+ (id)Health
{
  return (id)objc_opt_class();
}

+ (id)GenerativeExperiences
{
  return (id)objc_opt_class();
}

+ (id)GameController
{
  return (id)objc_opt_class();
}

+ (id)GameCenter
{
  return (id)objc_opt_class();
}

+ (id)FrontBoard
{
  return (id)objc_opt_class();
}

+ (id)Feedback
{
  return (id)objc_opt_class();
}

+ (id)Family
{
  return (id)objc_opt_class();
}

+ (id)Emoji
{
  return (id)objc_opt_class();
}

+ (id)Dictation
{
  return (id)objc_opt_class();
}

+ (id)ContextualUnderstanding
{
  return (id)objc_opt_class();
}

+ (id)ContextSync
{
  return (id)objc_opt_class();
}

+ (id)CommCenter
{
  return (id)objc_opt_class();
}

+ (id)Clock
{
  return (id)objc_opt_class();
}

+ (id)Carousel
{
  return (id)objc_opt_class();
}

+ (id)CarPlay
{
  return (id)objc_opt_class();
}

+ (id)CameraCapture
{
  return (id)objc_opt_class();
}

+ (id)Calendar
{
  return (id)objc_opt_class();
}

+ (id)Autonaming
{
  return (id)objc_opt_class();
}

+ (id)Audio
{
  return (id)objc_opt_class();
}

+ (id)AppleID
{
  return (id)objc_opt_class();
}

+ (id)App
{
  return (id)objc_opt_class();
}

+ (id)AirPlay
{
  return (id)objc_opt_class();
}

+ (id)AeroML
{
  return (id)objc_opt_class();
}

+ (id)AdPlatforms
{
  return (id)objc_opt_class();
}

+ (id)Activity
{
  return (id)objc_opt_class();
}

+ (id)ActivityScheduler
{
  return (id)objc_opt_class();
}

+ (id)Accessibility
{
  return (id)objc_opt_class();
}

+ (id)streamWithName:(id)a3
{
  return 0;
}

+ (id)validKeyPaths
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = (void *)[v2 copy];

  return v3;
}

+ (id)streamNames
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)identifier
{
  return @"BMLibrary";
}

@end