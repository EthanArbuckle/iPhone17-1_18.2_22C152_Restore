@interface MapsUILocalizationBridge
+ (id)addANotePromptText;
+ (id)addANoteTitle;
+ (id)addressSectionTitleString;
+ (id)amenitiesSectionTitle;
+ (id)callAccessibilityLabel;
+ (id)commaDelimeter;
+ (id)deleteNoteButtonLabel;
+ (id)developerPlaceCardCompactAttributionFormatString;
+ (id)developerPlaceCardOpenInMapsText;
+ (id)directionsTitleString;
+ (id)distanceAwayFormatString;
+ (id)dropPinAtCurrentLocationTitle;
+ (id)editNoteTitle;
+ (id)evChargers;
+ (id)evChargingOfflineChargers;
+ (id)evChargingOtherChargers;
+ (id)evChargingPlugDescriptionDelimiter;
+ (id)evChargingSectionHeaderAvailableNow;
+ (id)evChargingSpeedFast;
+ (id)evChargingSpeedSlow;
+ (id)forYourVehicleNameFormatString;
+ (id)forYourVehicleNameFormatStringThreeVehicles;
+ (id)forYourVehicleNameFormatStringTwoVehicles;
+ (id)forYourVehicles;
+ (id)hoursSectionTitleString;
+ (id)inlineMapAccessibilityLabel;
+ (id)interpunctDelimeter;
+ (id)loadingText;
+ (id)moreButtonLabel;
+ (id)moreLinesButtonSubText;
+ (id)moreLinesText;
+ (id)noteSectionTitle;
+ (id)phoneCallToActionTitle;
+ (id)photoAccessibilityLabel;
+ (id)photoFromSourceAccessibilityLabelFormat;
+ (id)photoSliderTitle;
+ (id)placeCardDistanceFactoidTitle;
+ (id)placeCardNoResultsErrorMessage;
+ (id)placeCardNotePrivacyText;
+ (id)placeDescriptionSectionTitle;
+ (id)priceRangeRibbonTitle;
+ (id)ratingsRibbonTitle;
+ (id)removeDroppedPinTitle;
+ (id)textBlockMoreText;
+ (id)trailheads;
+ (id)trails;
+ (id)transitConnectionsSectionHeaderTitle;
+ (id)transitDeparturesCountdownFormatString;
+ (id)transitDeparturesCountdownUnitString;
+ (id)transitDeparturesRowNowString;
+ (id)transitDeparturesSectionHeaderTitle;
+ (id)transitStationDeparturesFallbackErrorMessage;
+ (id)transportTypeEtaAccessibilityLabelFormat;
+ (id)watchRatingAndUserScoreFormatString;
+ (id)watchThirdPartyRatingRowFormatString;
@end

@implementation MapsUILocalizationBridge

+ (id)evChargingSectionHeaderAvailableNow
{
  return _MULocalizedStringFromThisBundle(@"Available Now [EV Charging Placecard section header]");
}

+ (id)evChargingPlugDescriptionDelimiter
{
  return _MULocalizedStringFromThisBundle(@"Delimiter [Placecard EV Charging plug description]");
}

+ (id)evChargingSpeedFast
{
  return _MULocalizedStringFromThisBundle(@"Fast [EV Charging Placecard]");
}

+ (id)evChargingSpeedSlow
{
  return _MULocalizedStringFromThisBundle(@"Slow [EV Charging Placecard]");
}

+ (id)evChargers
{
  return _MULocalizedStringFromThisBundle(@"Chargers [EV Charging]");
}

+ (id)evChargingOtherChargers
{
  return _MULocalizedStringFromThisBundle(@"Other Chargers [EV Charging Placecard section header]");
}

+ (id)evChargingOfflineChargers
{
  return _MULocalizedStringFromThisBundle(@"Offline Chargers [EV Charging Placecard section header]");
}

+ (id)transitDeparturesSectionHeaderTitle
{
  return _MULocalizedStringFromThisBundle(@"Departures [Placecard]");
}

+ (id)transitConnectionsSectionHeaderTitle
{
  return _MULocalizedStringFromThisBundle(@"Connections [Placecard]");
}

+ (id)transitDeparturesCountdownFormatString
{
  return _MULocalizedStringFromThisBundle(@"%@ min [PlaceCard, Transit, Departures, Countdown]");
}

+ (id)transitDeparturesCountdownUnitString
{
  return _MULocalizedStringFromThisBundle(@"min [PlaceCard, Transit, Departures, Countdown, Unit]");
}

+ (id)transitDeparturesRowNowString
{
  return _MULocalizedStringFromThisBundle(@"TransitDeparture_Now");
}

+ (id)commaDelimeter
{
  return _MULocalizedStringFromThisBundle(@", [Comma delimeter MapsUI]");
}

+ (id)interpunctDelimeter
{
  return _MULocalizedStringFromThisBundle(@" · [Interpunct delimeter MapsUI]");
}

+ (id)hoursSectionTitleString
{
  return _MULocalizedStringFromThisBundle(@"Hours [Placecard]");
}

+ (id)addressSectionTitleString
{
  return _MULocalizedStringFromThisBundle(@"Address [Placecard]");
}

+ (id)dropPinAtCurrentLocationTitle
{
  if (+[MULibraryUIUtilities isMyPlacesEnabled]) {
    v2 = @"Mark My Location [Place Card]";
  }
  else {
    v2 = @"Drop Pin [Place Card]";
  }
  v3 = _MULocalizedStringFromThisBundle(v2);
  return v3;
}

+ (id)removeDroppedPinTitle
{
  if (+[MULibraryUIUtilities isMyPlacesEnabled]) {
    v2 = @"Remove Marked Location [Place Card]";
  }
  else {
    v2 = @"Remove Dropped Pin [Place Card]";
  }
  v3 = _MULocalizedStringFromThisBundle(v2);
  return v3;
}

+ (id)phoneCallToActionTitle
{
  return _MULocalizedStringFromThisBundle(@"Call [Place Card]");
}

+ (id)directionsTitleString
{
  return _MULocalizedStringFromThisBundle(@"Directions [Placecard]");
}

+ (id)placeCardDistanceFactoidTitle
{
  return _MULocalizedStringFromThisBundle(@"Distance [Placecard]");
}

+ (id)photoSliderTitle
{
  return _MULocalizedStringFromThisBundle(@"Photos [Placecard]");
}

+ (id)amenitiesSectionTitle
{
  return _MULocalizedStringFromThisBundle(@"Good to Know [Placecard]");
}

+ (id)textBlockMoreText
{
  return _MULocalizedStringFromThisBundle(@"More [See All Blurb View]");
}

+ (id)placeDescriptionSectionTitle
{
  return _MULocalizedStringFromThisBundle(@"About [Placecard]");
}

+ (id)noteSectionTitle
{
  return _MULocalizedStringFromThisBundle(@"Note [Placecard]");
}

+ (id)forYourVehicleNameFormatString
{
  return _MULocalizedStringFromThisBundle(@"For Your car name [Placecard]");
}

+ (id)forYourVehicleNameFormatStringTwoVehicles
{
  return _MULocalizedStringFromThisBundle(@"For Your car-name-1 and car-name-2 [Placecard]");
}

+ (id)forYourVehicleNameFormatStringThreeVehicles
{
  return _MULocalizedStringFromThisBundle(@"For Your car-name-1, car-name-2, and car-name-3 [Placecard]");
}

+ (id)forYourVehicles
{
  return _MULocalizedStringFromThisBundle(@"For Your Vehicles [Placecard]");
}

+ (id)trails
{
  return _MULocalizedStringFromThisBundle(@"Trails [Place card]");
}

+ (id)trailheads
{
  return _MULocalizedStringFromThisBundle(@"Trailheads [Place card]");
}

+ (id)priceRangeRibbonTitle
{
  return _MULocalizedStringFromThisBundle(@"Cost [Placecard]");
}

+ (id)ratingsRibbonTitle
{
  return _MULocalizedStringFromThisBundle(@"Ratings [Section Header]");
}

+ (id)watchRatingAndUserScoreFormatString
{
  return _MULocalizedStringFromThisBundle(@"%@ (%@)");
}

+ (id)watchThirdPartyRatingRowFormatString
{
  return _MULocalizedStringFromThisBundle(@"%@ \non %@");
}

+ (id)loadingText
{
  return _MULocalizedStringFromThisBundle(@"Loading View");
}

+ (id)moreLinesText
{
  return _MULocalizedStringFromThisBundle(@"More Lines [Transit Station]");
}

+ (id)moreLinesButtonSubText
{
  return _MULocalizedStringFromThisBundle(@"+%@");
}

+ (id)inlineMapAccessibilityLabel
{
  return _MULocalizedStringFromThisBundle(@"Inline Map [Accessibility]");
}

+ (id)callAccessibilityLabel
{
  return _MULocalizedStringFromThisBundle(@"Call [Accessibility]");
}

+ (id)transportTypeEtaAccessibilityLabelFormat
{
  return _MULocalizedStringFromThisBundle(@"Directions label [Accessibility]");
}

+ (id)photoAccessibilityLabel
{
  return _MULocalizedStringFromThisBundle(@"Photo [Accessibility]");
}

+ (id)photoFromSourceAccessibilityLabelFormat
{
  return _MULocalizedStringFromThisBundle(@"Photo from <provider> [Accessibility]");
}

+ (id)placeCardNoResultsErrorMessage
{
  return _MULocalizedStringFromThisBundle(@"Place card loading error message");
}

+ (id)transitStationDeparturesFallbackErrorMessage
{
  return _MULocalizedStringFromThisBundle(@"Transit station departures fallback error message");
}

+ (id)distanceAwayFormatString
{
  return _MULocalizedStringFromThisBundle(@"[distance] away");
}

+ (id)moreButtonLabel
{
  return _MULocalizedStringFromThisBundle(@"More [Placecard]");
}

+ (id)addANoteTitle
{
  return _MULocalizedStringFromThisBundle(@"Add a note title [Placecard]");
}

+ (id)addANotePromptText
{
  return _MULocalizedStringFromThisBundle(@"Add a note prompt [Placecard]");
}

+ (id)editNoteTitle
{
  return _MULocalizedStringFromThisBundle(@"Edit Note [Placecard]");
}

+ (id)deleteNoteButtonLabel
{
  return _MULocalizedStringFromThisBundle(@"Delete Note [Placecard]");
}

+ (id)placeCardNotePrivacyText
{
  return _MULocalizedStringFromThisBundle(@"Note Privacy [Placecard]");
}

+ (id)developerPlaceCardOpenInMapsText
{
  return _MULocalizedStringFromThisBundle(@"[Developer Place Card] Open in Apple Maps");
}

+ (id)developerPlaceCardCompactAttributionFormatString
{
  return _MULocalizedStringFromThisBundle(@"[Developer Place Card] Compact Attribution");
}

@end