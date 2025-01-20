@interface WFContentLocationLocalizations
+ (id)localizedTitleForContentLocationWithHostname:(id)a3;
+ (id)localizedTitleForContentLocationWithIdentifier:(id)a3;
+ (id)sfSymbolNameForContentLocationWithIdentifier:(id)a3;
+ (id)symbolBackgroundColorForContentLocationWithIdentifier:(id)a3;
@end

@implementation WFContentLocationLocalizations

+ (id)localizedTitleForContentLocationWithHostname:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"evernote.com"])
  {
    v4 = @"Evernote";
LABEL_21:
    v5 = WFLocalizedString(v4);
    goto LABEL_22;
  }
  if ([v3 isEqualToString:@"api.giphy.com"])
  {
    v4 = @"GIPHY";
    goto LABEL_21;
  }
  if ([v3 isEqualToString:@"api.imgur.com"])
  {
    v4 = @"Imgur";
    goto LABEL_21;
  }
  if ([v3 isEqualToString:@"instapaper.com"])
  {
    v4 = @"Instapaper";
    goto LABEL_21;
  }
  if ([v3 isEqualToString:@"api.pinboard.in"])
  {
    v4 = @"Pinboard";
    goto LABEL_21;
  }
  if ([v3 isEqualToString:@"getpocket.com"])
  {
    v4 = @"Pocket";
    goto LABEL_21;
  }
  if ([v3 isEqualToString:@"todoist.com"])
  {
    v4 = @"Todoist";
    goto LABEL_21;
  }
  if ([v3 isEqualToString:@"api.trello.com"])
  {
    v4 = @"Trello";
    goto LABEL_21;
  }
  if ([v3 isEqualToString:@"tumblr.com"])
  {
    v4 = @"Tumblr";
    goto LABEL_21;
  }
  if ([v3 isEqualToString:@"wordpress.com"])
  {
    v4 = @"WordPress.com";
    goto LABEL_21;
  }
  v5 = 0;
LABEL_22:

  return v5;
}

+ (id)symbolBackgroundColorForContentLocationWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.shortcuts.airdropDestination"]) {
    goto LABEL_2;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.appleScriptDestination"]) {
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.clipboardDestination"])
  {
    v6 = (void *)MEMORY[0x263F851A8];
    double v7 = 0.325490206;
    double v8 = 0.345098048;
LABEL_6:
    uint64_t v9 = [v6 colorWithRed:0.925490201 green:v7 blue:v8 alpha:1.0];
LABEL_10:
    v10 = (void *)v9;
    goto LABEL_11;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.controlOtherApps"])
  {
LABEL_8:
    v4 = (void *)MEMORY[0x263F851A8];
    uint64_t v5 = 14;
    goto LABEL_9;
  }
  if (([v3 isEqualToString:@"com.apple.shortcuts.dataRoamingDestination"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.shortcuts.defaultLineDestination"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.shortcuts.toggleCellularLineDestination"] & 1) != 0
    || [v3 isEqualToString:@"com.apple.shortcuts.cellularDataStatisticsDestination"])
  {
LABEL_18:
    v4 = (void *)MEMORY[0x263F851A8];
    uint64_t v5 = 3;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.focusDestination"])
  {
    v4 = (void *)MEMORY[0x263F851A8];
    uint64_t v5 = 10;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.javaScriptForAutomationDestination"])goto LABEL_8; {
  if ([v3 isEqualToString:@"com.apple.shortcuts.microphoneDestination"])
  }
  {
LABEL_23:
    v6 = (void *)MEMORY[0x263F851A8];
    double v7 = 0.301960796;
    double v8 = 0.243137255;
    goto LABEL_6;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.networkDestination"]) {
    goto LABEL_2;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.notificationDestination"])
  {
    v4 = (void *)MEMORY[0x263F851A8];
    uint64_t v5 = 2;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.onScreenContentDestination"]) {
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.locationDestination"]) {
    goto LABEL_2;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.personalHotspotPasswordDestination"])goto LABEL_18; {
  if ([v3 isEqualToString:@"com.apple.shortcuts.printDestination"])
  }
    goto LABEL_8;
  if ([v3 isEqualToString:@"com.apple.shortcuts.shareExtensionDestination"]) {
    goto LABEL_32;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.shellDestination"]) {
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.screenshotDestination"]) {
    goto LABEL_2;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.speechRecognitionDestination"]) {
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.wallpaperDestination"])
  {
LABEL_32:
    v4 = (void *)MEMORY[0x263F851A8];
    uint64_t v5 = 9;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.webpagesDestination"])
  {
LABEL_2:
    v4 = (void *)MEMORY[0x263F851A8];
    uint64_t v5 = 4;
LABEL_9:
    uint64_t v9 = [v4 colorWithSystemColor:v5];
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.windowsDestination"]) {
    goto LABEL_8;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

+ (id)sfSymbolNameForContentLocationWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.shortcuts.airdropDestination"])
  {
    v4 = @"airdrop";
  }
  else
  {
    if ([v3 isEqualToString:@"com.apple.shortcuts.appleScriptDestination"]) {
      goto LABEL_4;
    }
    if ([v3 isEqualToString:@"com.apple.shortcuts.clipboardDestination"])
    {
      v4 = @"scissors";
      goto LABEL_14;
    }
    if ([v3 isEqualToString:@"com.apple.shortcuts.controlOtherApps"])
    {
      v4 = @"menubar.dock.rectangle.badge.record";
      goto LABEL_14;
    }
    if (([v3 isEqualToString:@"com.apple.shortcuts.dataRoamingDestination"] & 1) != 0
      || ([v3 isEqualToString:@"com.apple.shortcuts.defaultLineDestination"] & 1) != 0
      || ([v3 isEqualToString:@"com.apple.shortcuts.toggleCellularLineDestination"] & 1) != 0
      || ([v3 isEqualToString:@"com.apple.shortcuts.cellularDataStatisticsDestination"] & 1) != 0)
    {
      v4 = @"antenna.radiowaves.left.and.right";
      goto LABEL_14;
    }
    if ([v3 isEqualToString:@"com.apple.shortcuts.focusDestination"])
    {
      v4 = @"moon.fill";
      goto LABEL_14;
    }
    if ([v3 isEqualToString:@"com.apple.shortcuts.javaScriptForAutomationDestination"])
    {
LABEL_4:
      v4 = @"applescript.fill";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.microphoneDestination"])
    {
      v4 = @"mic.fill";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.networkDestination"])
    {
      v4 = @"network";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.notificationDestination"])
    {
      v4 = @"app.badge";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.onScreenContentDestination"])
    {
      v4 = @"display";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.locationDestination"])
    {
      v4 = @"location.fill";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.personalHotspotPasswordDestination"])
    {
      v4 = @"personalhotspot";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.printDestination"])
    {
      v4 = @"printer.fill";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.shareExtensionDestination"])
    {
      v4 = @"square.and.arrow.up";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.shellDestination"])
    {
      v4 = @"terminal.fill";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.screenshotDestination"])
    {
      v4 = @"camera.viewfinder";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.speechRecognitionDestination"])
    {
      v4 = @"waveform";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.wallpaperDestination"])
    {
      v4 = @"photos";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.webpagesDestination"])
    {
      v4 = @"safari.fill";
    }
    else if ([v3 isEqualToString:@"com.apple.shortcuts.windowsDestination"])
    {
      v4 = @"gear";
    }
    else
    {
      v4 = 0;
    }
  }
LABEL_14:

  return v4;
}

+ (id)localizedTitleForContentLocationWithIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.shortcuts.airdropDestination"])
  {
    v4 = @"AirDrop";
LABEL_29:
    uint64_t v5 = WFLocalizedString(v4);
LABEL_30:
    v6 = (void *)v5;
    goto LABEL_31;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.appleScriptDestination"])
  {
    v4 = @"AppleScript";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.cellularDataStatisticsDestination"])
  {
    v4 = @"Cellular Data Statistics";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.clipboardDestination"])
  {
    v4 = @"Clipboard";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.controlOtherApps"])
  {
    v4 = @"Control Other Apps";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.dataRoamingDestination"])
  {
    v4 = @"Data Roaming";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.defaultLineDestination"])
  {
    v4 = @"Default Cellular Line";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.focusDestination"])
  {
    v4 = @"Focus";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.javaScript"])
  {
    v4 = @"JavaScript";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.javaScriptForAutomationDestination"])
  {
    v4 = @"JavaScript for Automation";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.microphoneDestination"])
  {
    v4 = @"Microphone";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.networkDestination"])
  {
    v4 = @"Network Information";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.notificationDestination"])
  {
    v4 = @"Notification";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.onScreenContentDestination"])
  {
    v4 = @"On Screen Content";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.locationDestination"])
  {
    double v8 = @"UserLocation";
    uint64_t v9 = @"Location";
LABEL_40:
    uint64_t v5 = WFLocalizedStringWithKey(v8, v9);
    goto LABEL_30;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.personalHotspotPasswordDestination"])
  {
    double v8 = @"PersonalHotspotPasswordLocation";
    uint64_t v9 = @"Personal Hotspot Password";
    goto LABEL_40;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.printDestination"])
  {
    double v8 = @"PrinterPermission";
    uint64_t v9 = @"Printer";
    goto LABEL_40;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.shareExtensionDestination"])
  {
    v4 = @"Share extension";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.shellDestination"])
  {
    v4 = @"Shell";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.screenshotDestination"])
  {
    v4 = @"Screenshot";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.speechRecognitionDestination"])
  {
    v4 = @"Speech Recognition";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.toggleCellularLineDestination"])
  {
    v4 = @"Toggle Cellular Plan";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.wallpaperDestination"])
  {
    v4 = @"Wallpaper";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.webpagesDestination"])
  {
    v4 = @"Web Content";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.windowsDestination"])
  {
    v4 = @"Windows";
    goto LABEL_29;
  }
  if ([v3 isEqualToString:@"com.apple.shortcuts.publicICloudDestination"])
  {
    v4 = @"iCloud";
    goto LABEL_29;
  }
  v6 = 0;
LABEL_31:

  return v6;
}

@end