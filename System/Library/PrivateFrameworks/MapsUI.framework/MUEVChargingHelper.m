@interface MUEVChargingHelper
+ (id)evPlugIconWithConfiguration:(id)a3;
+ (id)getRealTimeEVChargerInfo:(id)a3 charger:(id)a4;
+ (id)localizedStringForAvailableChargers:(unint64_t)a3 outOfTotal:(unint64_t)a4;
+ (id)localizedStringForAvailableChargers:(unint64_t)a3 outOfTotal:(unint64_t)a4 radiowavesSymbolScale:(int64_t)a5;
@end

@implementation MUEVChargingHelper

+ (id)localizedStringForAvailableChargers:(unint64_t)a3 outOfTotal:(unint64_t)a4
{
  v6 = _MULocalizedStringFromThisBundle(@"[Placecard] Number of chargers available out of total");
  v7 = objc_msgSend(NSString, "localizedStringWithFormat:", v6, a3, a4);

  return v7;
}

+ (id)localizedStringForAvailableChargers:(unint64_t)a3 outOfTotal:(unint64_t)a4 radiowavesSymbolScale:(int64_t)a5
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v6 = [a1 localizedStringForAvailableChargers:a3 outOfTotal:a4];
  v7 = (void *)MEMORY[0x1E4FB1818];
  v8 = [MEMORY[0x1E4FB1830] configurationWithScale:a5];
  v9 = [v7 systemImageNamed:@"dot.radiowaves.up.forward" withConfiguration:v8];

  v10 = (void *)MEMORY[0x1E4FB0870];
  v11 = [v9 imageWithRenderingMode:2];
  v12 = [v10 textAttachmentWithImage:v11];

  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28B18]), "initWithString:", @" ", v13);
  v19[1] = v14;
  v15 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v12];
  v19[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v17 = +[MapsUILayout buildAttributedDisplayStringForComponents:v16 reverseIfRTLLayout:0];

  return v17;
}

+ (id)getRealTimeEVChargerInfo:(id)a3 charger:(id)a4
{
  return +[MURealTimeEVChargerUtility getRealTimeChargerInfoWithGarage:a3 charger:a4];
}

+ (id)evPlugIconWithConfiguration:(id)a3
{
  return +[MURealTimeEVChargerUtility evPlugIconWithConfiguration:a3];
}

@end