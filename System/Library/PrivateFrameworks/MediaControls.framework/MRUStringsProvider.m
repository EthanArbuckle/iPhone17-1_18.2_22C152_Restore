@interface MRUStringsProvider
+ (NSString)airPlayErrorTitle;
+ (NSString)airplayErrorExternalDisplay;
+ (NSString)airplayTitle;
+ (NSString)audioSessionRenderingModeDolbyAtmos;
+ (NSString)audioSessionRenderingModeDolbyAudio;
+ (NSString)audioSessionRenderingModeMonoStereo;
+ (NSString)audioSessionRenderingModeSpatialAudio;
+ (NSString)audioSessionRenderingModeSurround;
+ (NSString)audioShaingActionTitle;
+ (NSString)audioShaingDisabledCarKit;
+ (NSString)audioSharingDisabledCarKitSameOwner;
+ (NSString)audioSharingDisabledCarPlay;
+ (NSString)audioSharingDisabledCarPlaySameOwner;
+ (NSString)bestAvailableAudioFormatAtmos;
+ (NSString)bestAvailableAudioFormatMulitchannel;
+ (NSString)cancel;
+ (NSString)connecting;
+ (NSString)controlOtherSpeakers;
+ (NSString)controlOtherSpeakersMultipleLines;
+ (NSString)controlsUnavailable;
+ (NSString)conversationAwarenessOff;
+ (NSString)conversationAwarenessOn;
+ (NSString)conversationAwarenessTitle;
+ (NSString)corianderTopOfListIndicator;
+ (NSString)explicitBadge;
+ (NSString)groupSessionEndBody;
+ (NSString)groupSessionEndCancel;
+ (NSString)groupSessionEndConfirm;
+ (NSString)groupSessionEndTitle;
+ (NSString)listeningModeAutomatic;
+ (NSString)listeningModeErrorMessage;
+ (NSString)listeningModeErrorMessageB494;
+ (NSString)listeningModeErrorMessageB498;
+ (NSString)listeningModeErrorMessageB507;
+ (NSString)listeningModeErrorMessageB515;
+ (NSString)listeningModeErrorMessageB607;
+ (NSString)listeningModeNoiseCancellation;
+ (NSString)listeningModeOff;
+ (NSString)listeningModeTitle;
+ (NSString)listeningModeTransparency;
+ (NSString)loading;
+ (NSString)notConnected;
+ (NSString)notPlaying;
+ (NSString)ok;
+ (NSString)routeNameEllipsisString;
+ (NSString)routeNamePlusSeparator;
+ (NSString)routeRecommendationAirPlayConnected;
+ (NSString)routeRecommendationTapToAirPlay;
+ (NSString)routingFooterShowMoreTitle;
+ (NSString)routingHeaderSpeakersAndTVsTitle;
+ (NSString)routingHijackCancelTitle;
+ (NSString)routingHijackConfirmTitle;
+ (NSString)routingHijackSpeakerMessage;
+ (NSString)routingHijackSpeakerTitle;
+ (NSString)routingHijackTVMessage;
+ (NSString)routingHijackTVTitle;
+ (NSString)screenMirroring;
+ (NSString)scrubberLive;
+ (NSString)spatialButtonNotAvailable;
+ (NSString)spatialButtonSubtitleHeadTracked;
+ (NSString)spatialButtonSubtitleOff;
+ (NSString)spatialButtonSubtitleOn;
+ (NSString)spatialButtonTitle;
+ (NSString)spatializeStereoButtonTitle;
+ (NSString)stopMirroring;
+ (NSString)transportBookmarkTitle;
+ (NSString)transportDislikeTitle;
+ (NSString)transportLikeTitle;
+ (NSString)vendorSpecificAirPlay;
+ (NSString)vendorSpecificGroupMultiRoutes;
+ (NSString)volumeAirPlay;
+ (NSString)volumeAirPods;
+ (NSString)volumeAppleTV;
+ (NSString)volumeB494;
+ (NSString)volumeBeats;
+ (NSString)volumeBeatsFlex;
+ (NSString)volumeBeatsSolo;
+ (NSString)volumeBeatsSoloPro;
+ (NSString)volumeBeatsStudio;
+ (NSString)volumeBeatsX;
+ (NSString)volumeBluetooth;
+ (NSString)volumeCarplay;
+ (NSString)volumeHeadphones;
+ (NSString)volumeHearingDevice;
+ (NSString)volumeHomePod;
+ (NSString)volumePowerbeats;
+ (NSString)volumeSharing;
+ (NSString)volumeSpeaker;
+ (id)accessoryBatteryLevelCase:(id)a3;
+ (id)accessoryBatteryLevelCombinedLeft:(id)a3 right:(id)a4;
+ (id)accessoryBatteryLevelLeft:(id)a3;
+ (id)accessoryBatteryLevelRight:(id)a3;
+ (id)accessoryBatteryLevelSingle:(id)a3;
+ (id)airPlayConnectionErrorMessage:(id)a3;
+ (id)composedBy:(id)a3;
+ (id)localizedNameForBundleIdentifier:(id)a3;
+ (id)localizedStringWithKey:(id)a3;
+ (id)localizedStringWithKey:(id)a3 count:(unint64_t)a4;
+ (id)localizedStringWithKey:(id)a3 inTable:(id)a4;
+ (id)localizedUppercaseStringWithKey:(id)a3 expectedFormat:(id)a4;
+ (id)nowPlayingSiriSuggestion:(id)a3;
+ (id)routeName:(id)a3 plusCount:(int64_t)a4;
+ (id)routeNameArrowFormat:(id)a3 rightSideText:(id)a4;
+ (id)routeNameHeadphonesCount:(int64_t)a3;
+ (id)routeRecommendationAddWithFormattedExistingRouteName:(id)a3;
+ (id)routingHijackLocalMessagePresentingApp:(id)a3 busyRouteName:(id)a4;
+ (id)routingHijackLocalTitle:(id)a3;
+ (id)routingInUseOnPairedDevice:(id)a3;
+ (id)vendorSpecificGroupConnectWith:(id)a3;
+ (id)vendorSpecificGroupConnectedWith:(id)a3;
+ (id)vendorSpecificRouteConnectWith:(id)a3;
+ (id)vendorSpecificRouteConnectedWith:(id)a3;
+ (id)volumeTV;
+ (id)volumeTVWithDeviceCount:(unint64_t)a3;
@end

@implementation MRUStringsProvider

+ (id)localizedStringWithKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 mediaRemoteUIBundle];
  v6 = [v5 localizedStringForKey:v4 value:&stru_1F06524E0 table:@"MediaControls"];

  return v6;
}

+ (NSString)spatialButtonTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_SPATIAL_AUDIO_TITLE"];
}

+ (NSString)notPlaying
{
  return (NSString *)[a1 localizedStringWithKey:@"MEDIA_CONTROLS_EMPTY_STATE_TITLE"];
}

+ (NSString)scrubberLive
{
  return (NSString *)[a1 localizedStringWithKey:@"SCRUBBER_LIVE"];
}

+ (NSString)controlOtherSpeakers
{
  return (NSString *)[a1 localizedStringWithKey:@"CONTROL_OTHER_SPEAKERS"];
}

+ (NSString)controlOtherSpeakersMultipleLines
{
  return (NSString *)[a1 localizedStringWithKey:@"CONTROL_OTHER_SPEAKERS_MULTIPLE_LINES"];
}

+ (NSString)loading
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTE_LOADING_TITLE"];
}

+ (NSString)connecting
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTE_CONNECTING_TITLE"];
}

+ (NSString)notConnected
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTE_NOT_CONNECTED_TITLE"];
}

+ (NSString)controlsUnavailable
{
  return (NSString *)[a1 localizedStringWithKey:@"MEDIA_CONTROLS_CONTROLS_UNAVAILABLE"];
}

+ (NSString)airplayTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"AIRPLAY_TITLE"];
}

+ (NSString)airPlayErrorTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"AIRPLAY_ERROR_TITLE"];
}

+ (NSString)airplayErrorExternalDisplay
{
  return (NSString *)[a1 localizedStringWithKey:@"AIRPLAY_ERROR_EXTERNAL_DISPLAY"];
}

+ (NSString)ok
{
  return (NSString *)[a1 localizedStringWithKey:@"OK_BUTTON_TITLE"];
}

+ (NSString)cancel
{
  return (NSString *)[a1 localizedStringWithKey:@"CANCEL"];
}

+ (NSString)explicitBadge
{
  return (NSString *)@"🅴";
}

+ (id)composedBy:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"COMPOSED_BY_TITLE_%@"];
  v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (id)airPlayConnectionErrorMessage:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"AIRPLAY_CONNECTION_ERROR_MESSAGE" expectedFormat:@"%@"];
  v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (NSString)transportLikeTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"LIKE_TRACK_DEFAULT_TITLE"];
}

+ (NSString)transportDislikeTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"DISLIKE_TRACK_DEFAULT_TITLE"];
}

+ (NSString)transportBookmarkTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"BOOKMARK_TRACK_DEFAULT_TITLE"];
}

+ (NSString)routingHeaderSpeakersAndTVsTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTING_HEADER_SPEAKERS_AND_TVS_TITLE"];
}

+ (NSString)routingFooterShowMoreTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTING_FOOTER_SHOW_MORE_TITLE"];
}

+ (NSString)routingHijackConfirmTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTING_HIJACK_CONFIRM_TITLE"];
}

+ (NSString)routingHijackCancelTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTING_HIJACK_CANCEL_TITLE"];
}

+ (NSString)routingHijackSpeakerTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTING_HIJACK_SPEAKER_TITLE"];
}

+ (NSString)routingHijackSpeakerMessage
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTING_HIJACK_SPEAKER_MESSAGE"];
}

+ (NSString)routingHijackTVTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTING_HIJACK_TV_TITLE"];
}

+ (NSString)routingHijackTVMessage
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTING_HIJACK_TV_MESSAGE"];
}

+ (id)routingInUseOnPairedDevice:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"ROUTING_IN_USE_ON_PAIRED_DEVICE" expectedFormat:@"%@"];
  v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (id)routingHijackLocalTitle:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"ROUTING_HIJACK_LOCAL_TITLE" expectedFormat:@"%@"];
  v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (id)routingHijackLocalMessagePresentingApp:(id)a3 busyRouteName:(id)a4
{
  v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  v9 = [a1 localizedStringWithKey:@"ROUTING_HIJACK_LOCAL_MESSAGE" expectedFormat:@"%@ %@"];
  v10 = objc_msgSend(v6, "stringWithFormat:", v9, v8, v7);

  return v10;
}

+ (NSString)corianderTopOfListIndicator
{
  return (NSString *)@"Coriander: ";
}

+ (NSString)audioShaingActionTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"AUDIO_SHARING_ACTION_TITLE"];
}

+ (NSString)audioSharingDisabledCarPlay
{
  return (NSString *)[a1 localizedStringWithKey:@"AUDIO_SHARING_DISABLED_CARPLAY"];
}

+ (NSString)audioSharingDisabledCarPlaySameOwner
{
  return (NSString *)[a1 localizedStringWithKey:@"AUDIO_SHARING_DISABLED_CARPLAY_SAME_OWNER"];
}

+ (NSString)audioShaingDisabledCarKit
{
  return (NSString *)[a1 localizedStringWithKey:@"AUDIO_SHARING_DISABLED_CARKIT"];
}

+ (NSString)audioSharingDisabledCarKitSameOwner
{
  return (NSString *)[a1 localizedStringWithKey:@"AUDIO_SHARING_DISABLED_CARKIT_SAME_OWNER"];
}

+ (id)accessoryBatteryLevelSingle:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"ACCESSORY_BATTERY_LEVEL_SINGLE" expectedFormat:@"%@"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (id)accessoryBatteryLevelLeft:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"ACCESSORY_BATTERY_LEVEL_LEFT" expectedFormat:@"%@"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (id)accessoryBatteryLevelRight:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"ACCESSORY_BATTERY_LEVEL_RIGHT" expectedFormat:@"%@"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (id)accessoryBatteryLevelCombinedLeft:(id)a3 right:(id)a4
{
  v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  v9 = [a1 localizedStringWithKey:@"ACCESSORY_BATTERY_LEVEL_COMBINED" expectedFormat:@"%@ %@"];
  v10 = objc_msgSend(v6, "stringWithFormat:", v9, v8, v7);

  return v10;
}

+ (id)accessoryBatteryLevelCase:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"ACCESSORY_BATTERY_LEVEL_CASE" expectedFormat:@"%@"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (NSString)volumeSpeaker
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_SPEAKER"];
}

+ (NSString)volumeSharing
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_SHARING"];
}

+ (NSString)volumeCarplay
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_CARPLAY"];
}

+ (NSString)volumeHearingDevice
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_HEARING_DEVICE"];
}

+ (NSString)volumeHeadphones
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_HEADPHONES"];
}

+ (NSString)volumeBluetooth
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_BLUETOOTH"];
}

+ (NSString)volumeAirPods
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_AIRPODS"];
}

+ (NSString)volumeBeats
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_BEATS"];
}

+ (NSString)volumeBeatsSolo
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_BEATS_SOLO"];
}

+ (NSString)volumeBeatsSoloPro
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_BEATS_SOLO_PRO"];
}

+ (NSString)volumeBeatsStudio
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_BEATS_STUDIO"];
}

+ (NSString)volumeBeatsX
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_BEATS_X"];
}

+ (NSString)volumePowerbeats
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_POWERBEATS"];
}

+ (NSString)volumeBeatsFlex
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_BEATS_FLEX"];
}

+ (NSString)volumeB494
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_B494" inTable:@"MediaControls-B494"];
}

+ (NSString)volumeAirPlay
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_AIRPLAY"];
}

+ (NSString)volumeAppleTV
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_APPLE_TV"];
}

+ (id)volumeTV
{
  return (id)[a1 localizedStringWithKey:@"VOLUME_TV"];
}

+ (NSString)volumeHomePod
{
  return (NSString *)[a1 localizedStringWithKey:@"VOLUME_HOMEPOD"];
}

+ (id)volumeTVWithDeviceCount:(unint64_t)a3
{
  return (id)[a1 localizedStringWithKey:@"MATCHPOINT_TV" count:a3];
}

+ (NSString)spatializeStereoButtonTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"SPATIALIZE_STEREO_TITLE"];
}

+ (NSString)spatialButtonSubtitleOn
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_SPATIAL_AUDIO_ON"];
}

+ (NSString)spatialButtonSubtitleOff
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_SPATIAL_AUDIO_OFF"];
}

+ (NSString)spatialButtonSubtitleHeadTracked
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_SPATIAL_HEAD_TRACKED"];
}

+ (NSString)spatialButtonNotAvailable
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_SPATIAL_NOT_AVAILABLE"];
}

+ (NSString)bestAvailableAudioFormatMulitchannel
{
  return (NSString *)[a1 localizedStringWithKey:@"BEST_AVAILABLE_AUDIO_FORMAT_MULTICHANNEL"];
}

+ (NSString)bestAvailableAudioFormatAtmos
{
  return (NSString *)[a1 localizedStringWithKey:@"BEST_AVAILABLE_AUDIO_FORMAT_ATMOS"];
}

+ (NSString)audioSessionRenderingModeMonoStereo
{
  return (NSString *)[a1 localizedStringWithKey:@"AUDIO_SESSION_RENDERING_MODE_MONO_STEREO"];
}

+ (NSString)audioSessionRenderingModeSurround
{
  return (NSString *)[a1 localizedStringWithKey:@"AUDIO_SESSION_RENDERING_MODE_SURROUND"];
}

+ (NSString)audioSessionRenderingModeSpatialAudio
{
  return (NSString *)[a1 localizedStringWithKey:@"AUDIO_SESSION_RENDERING_MODE_SPATIAL_AUDIO"];
}

+ (NSString)audioSessionRenderingModeDolbyAudio
{
  return (NSString *)[a1 localizedStringWithKey:@"AUDIO_SESSION_RENDERING_MODE_DOLBY_AUDIO"];
}

+ (NSString)audioSessionRenderingModeDolbyAtmos
{
  return (NSString *)[a1 localizedStringWithKey:@"AUDIO_SESSION_RENDERING_MODE_DOLBY_ATMOS"];
}

+ (NSString)listeningModeTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_LISTENING_MODE_NOISE_CONTROL_TITLE"];
}

+ (NSString)listeningModeNoiseCancellation
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_LISTENING_MODE_NOISE_CANCELLATION_TITLE"];
}

+ (NSString)listeningModeOff
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_LISTENING_MODE_OFF_TITLE"];
}

+ (NSString)listeningModeAutomatic
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_LISTENING_MODE_AUTOMATIC_TITLE"];
}

+ (NSString)listeningModeTransparency
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_LISTENING_MODE_TRANSPARENCY_TITLE"];
}

+ (NSString)listeningModeErrorMessage
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_LISTENING_MODE_REQUIRES_BOTH_BUDS_IN_EAR"];
}

+ (NSString)listeningModeErrorMessageB507
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_LISTENING_MODE_REQUIRES_BOTH_BUDS_IN_EAR_B507"];
}

+ (NSString)listeningModeErrorMessageB515
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_LISTENING_MODE_REQUIRES_ON_HEAD_B515"];
}

+ (NSString)listeningModeErrorMessageB494
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_LISTENING_MODE_REQUIRES_BOTH_BUDS_IN_EAR_B494" inTable:@"MediaControls-B494"];
}

+ (NSString)listeningModeErrorMessageB498
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_LISTENING_MODE_REQUIRES_BOTH_BUDS_IN_EAR_B498" inTable:@"MediaControls-B498"];
}

+ (NSString)listeningModeErrorMessageB607
{
  return (NSString *)[a1 localizedStringWithKey:@"BLUETOOTH_LISTENING_MODE_REQUIRES_BOTH_BUDS_IN_EAR_B607" inTable:@"MediaControls-B607"];
}

+ (NSString)conversationAwarenessTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"CONVERSATION_DETECTION_TITLE"];
}

+ (NSString)conversationAwarenessOff
{
  return (NSString *)[a1 localizedStringWithKey:@"CONVERSATION_DETECTION_STATE_OFF"];
}

+ (NSString)conversationAwarenessOn
{
  return (NSString *)[a1 localizedStringWithKey:@"CONVERSATION_DETECTION_STATE_ON"];
}

+ (NSString)screenMirroring
{
  return (NSString *)[a1 localizedStringWithKey:@"MIRRORING_TITLE"];
}

+ (NSString)stopMirroring
{
  return (NSString *)[a1 localizedStringWithKey:@"MIRRORING_STOP"];
}

+ (NSString)vendorSpecificAirPlay
{
  return (NSString *)[a1 localizedStringWithKey:@"VENDOR_SPECIFIC_AIRPLAY"];
}

+ (NSString)vendorSpecificGroupMultiRoutes
{
  return (NSString *)[a1 localizedStringWithKey:@"VENDOR_SPECIFIC_GROUP_MULTI_ROUTES"];
}

+ (NSString)groupSessionEndTitle
{
  return (NSString *)[a1 localizedStringWithKey:@"GROUP_SESSION_END_TITLE"];
}

+ (NSString)groupSessionEndBody
{
  return (NSString *)[a1 localizedStringWithKey:@"GROUP_SESSION_END_BODY"];
}

+ (NSString)groupSessionEndConfirm
{
  return (NSString *)[a1 localizedStringWithKey:@"GROUP_SESSION_END_CONFIRM"];
}

+ (NSString)groupSessionEndCancel
{
  return (NSString *)[a1 localizedStringWithKey:@"GROUP_SESSION_END_CANCEL"];
}

+ (NSString)routeRecommendationTapToAirPlay
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTE_RECOMMENDATION_TAP_TO_AIRPLAY"];
}

+ (NSString)routeRecommendationAirPlayConnected
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTE_RECOMMENDATION_AIRPLAY_CONNECTED"];
}

+ (id)routeRecommendationAddWithFormattedExistingRouteName:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"ROUTE_RECOMMENDATION_ADD_TO_EXISTING_%@"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (id)vendorSpecificRouteConnectWith:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"VENDOR_SPECIFIC_ROUTE_CONNECT_WITH_%@"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (id)vendorSpecificRouteConnectedWith:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"VENDOR_SPECIFIC_ROUTE_CONNECTED_WITH_%@"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (id)vendorSpecificGroupConnectWith:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"VENDOR_SPECIFIC_GROUP_CONNECT_WITH_%@"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (id)vendorSpecificGroupConnectedWith:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedStringWithKey:@"VENDOR_SPECIFIC_GROUP_CONNECTED_WITH_%@"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (NSString)routeNameEllipsisString
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTE_NAME_CENTER_TRUNCATING_SEPARATOR"];
}

+ (NSString)routeNamePlusSeparator
{
  return (NSString *)[a1 localizedStringWithKey:@"ROUTE_NAME_PLUS_SEPARATOR"];
}

+ (id)routeName:(id)a3 plusCount:(int64_t)a4
{
  v6 = NSString;
  id v7 = a3;
  id v8 = [a1 localizedStringWithKey:@"ROUTE_NAME_PLUS_COUNT" expectedFormat:@"%@ %lu"];
  v9 = objc_msgSend(v6, "stringWithFormat:", v8, v7, a4);

  return v9;
}

+ (id)routeNameArrowFormat:(id)a3 rightSideText:(id)a4
{
  v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  v9 = [a1 localizedStringWithKey:@"ROUTE_NAME_ARROW_FORMAT" expectedFormat:@"%@ %@"];
  v10 = objc_msgSend(v6, "stringWithFormat:", v9, v8, v7);

  return v10;
}

+ (id)nowPlayingSiriSuggestion:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  v6 = [a1 localizedUppercaseStringWithKey:@"NOW_PLAYING_SIRI_SUGGESTION" expectedFormat:@"%@"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  return v7;
}

+ (id)routeNameHeadphonesCount:(int64_t)a3
{
  id v4 = NSString;
  id v5 = [a1 localizedStringWithKey:@"ROUTE_NAME_HEADPHONES_COUNT" expectedFormat:@"%lu"];
  v6 = objc_msgSend(v4, "stringWithFormat:", v5, a3);

  return v6;
}

+ (id)localizedNameForBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (localizedNameForBundleIdentifier__onceToken != -1)
  {
    dispatch_once(&localizedNameForBundleIdentifier__onceToken, &__block_literal_global);
    if (v4) {
      goto LABEL_3;
    }
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  if (!v3) {
    goto LABEL_9;
  }
LABEL_3:
  id v5 = [(id)localizedNameForBundleIdentifier___localizedNamesForBundleIdentifiers objectForKey:v4];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F223C8] bundleRecordWithApplicationIdentifier:v4 error:0];
    uint64_t v7 = [v6 localizedName];
    id v8 = (void *)v7;
    v9 = &stru_1F06524E0;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    v10 = v9;

    [(id)localizedNameForBundleIdentifier___localizedNamesForBundleIdentifiers setObject:v10 forKey:v4];
  }
  v11 = [(id)localizedNameForBundleIdentifier___localizedNamesForBundleIdentifiers objectForKey:v4];
LABEL_10:

  return v11;
}

uint64_t __55__MRUStringsProvider_localizedNameForBundleIdentifier___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)localizedNameForBundleIdentifier___localizedNamesForBundleIdentifiers;
  localizedNameForBundleIdentifier___localizedNamesForBundleIdentifiers = (uint64_t)v0;

  v2 = (void *)localizedNameForBundleIdentifier___localizedNamesForBundleIdentifiers;

  return [v2 setCountLimit:50];
}

+ (id)localizedUppercaseStringWithKey:(id)a3 expectedFormat:(id)a4
{
  id v4 = [a1 localizedStringWithKey:a3 expectedFormat:a4];
  id v5 = [v4 localizedUppercaseString];

  return v5;
}

+ (id)localizedStringWithKey:(id)a3 inTable:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 mediaRemoteUIBundle];
  v9 = [v8 localizedStringForKey:v7 value:&stru_1F06524E0 table:v6];

  return v9;
}

+ (id)localizedStringWithKey:(id)a3 count:(unint64_t)a4
{
  id v5 = NSString;
  id v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a3;
  id v8 = [v6 mediaRemoteUIBundle];
  v9 = [v8 localizedStringForKey:v7 value:&stru_1F06524E0 table:@"MediaControls"];

  v10 = objc_msgSend(v5, "stringWithFormat:", v9, a4);

  return v10;
}

@end