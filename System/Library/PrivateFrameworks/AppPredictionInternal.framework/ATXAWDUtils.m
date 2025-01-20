@interface ATXAWDUtils
+ (double)scoreMultiplierWithInputType:(unint64_t)a3;
+ (id)appDataAtIndex:(unint64_t)a3 forSessionLogDict:(id)a4;
+ (id)populateAwdAppPredictionSessionForSessionLogDict:(id)a3;
+ (id)subscoresWithDictionary:(id)a3;
+ (int)AWDLOITypeForString:(id)a3;
+ (int)awdActionEngagementWithEngagement:(unint64_t)a3;
+ (int)awdActionTypeWithActionType:(unint64_t)a3;
+ (int)awdAppLaunchReasonWithString:(id)a3;
+ (int)awdConsumerSubTypeWithConsumerSubType:(unsigned __int8)a3;
+ (int)awdLOITypeWithRTLOI:(int64_t)a3;
+ (int)awdMotionTypeWithMotionType:(int64_t)a3;
+ (int)awdPredictionOutcomeWithATXPredictionOutcome:(unint64_t)a3;
+ (int)awdScoreWithScore:(double)a3 type:(unint64_t)a4;
+ (void)logAppPredictionDictionaryViaAWD:(id)a3;
@end

@implementation ATXAWDUtils

+ (int)awdScoreWithScore:(double)a3 type:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 == -31337.0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"ATXAWDUtils.m", 23, @"Invalid parameter not satisfying: %@", @"score != _ATXScoreNotSet" object file lineNumber description];
  }
  +[ATXAWDUtils scoreMultiplierWithInputType:a4];
  double v7 = fabs(a3);
  if (v7 < INFINITY || v7 > INFINITY)
  {
    double v10 = v6 * a3;
    if (v10 >= -2147483650.0)
    {
      if (v10 <= 2147483650.0)
      {
        int v12 = (int)v10;
      }
      else
      {
        v13 = __atxlog_handle_default();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          +[ATXAWDUtils awdScoreWithScore:type:]();
        }

        int v12 = 0x7FFFFFFF;
      }
    }
    else
    {
      v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        +[ATXAWDUtils awdScoreWithScore:type:]();
      }

      int v12 = 0x80000000;
    }
    return v12 - ((double)v12 == -31337.0);
  }
  else
  {
    v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v18 = a4;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Unexpected nonfinite score input encountered during feedback for scoreType: %lu", buf, 0xCu);
    }

    return (int)-31337.0;
  }
}

+ (double)scoreMultiplierWithInputType:(unint64_t)a3
{
  double result = 1.0;
  switch(a3)
  {
    case 5uLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x34uLL:
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3DuLL:
    case 0x3FuLL:
    case 0x41uLL:
    case 0x44uLL:
    case 0x46uLL:
    case 0x49uLL:
    case 0x4EuLL:
    case 0x4FuLL:
    case 0x50uLL:
    case 0x51uLL:
    case 0x52uLL:
    case 0x53uLL:
    case 0x54uLL:
    case 0x55uLL:
    case 0x56uLL:
    case 0x57uLL:
    case 0x58uLL:
    case 0x59uLL:
    case 0x5AuLL:
    case 0x5BuLL:
    case 0x5CuLL:
    case 0x5DuLL:
    case 0x5EuLL:
    case 0x61uLL:
    case 0x62uLL:
    case 0x63uLL:
    case 0x64uLL:
    case 0x6FuLL:
    case 0x70uLL:
    case 0x71uLL:
    case 0x72uLL:
    case 0x73uLL:
    case 0x74uLL:
    case 0x75uLL:
    case 0x76uLL:
    case 0x77uLL:
    case 0x78uLL:
    case 0x79uLL:
    case 0x7AuLL:
    case 0x7BuLL:
    case 0x7CuLL:
    case 0x7DuLL:
    case 0x81uLL:
    case 0x82uLL:
    case 0x83uLL:
    case 0x88uLL:
    case 0x89uLL:
    case 0x8AuLL:
    case 0x8BuLL:
    case 0x8CuLL:
    case 0x8DuLL:
    case 0x8EuLL:
    case 0x8FuLL:
    case 0x90uLL:
    case 0x91uLL:
    case 0x92uLL:
    case 0x9DuLL:
    case 0x9EuLL:
    case 0x9FuLL:
    case 0xA0uLL:
    case 0xA1uLL:
    case 0xA2uLL:
    case 0xA3uLL:
    case 0xA4uLL:
    case 0xA5uLL:
    case 0xA6uLL:
    case 0xA7uLL:
    case 0xA8uLL:
    case 0xA9uLL:
    case 0xAAuLL:
    case 0xABuLL:
    case 0xACuLL:
    case 0xADuLL:
    case 0xAEuLL:
    case 0xAFuLL:
    case 0xB0uLL:
    case 0xB1uLL:
    case 0xB2uLL:
    case 0xB3uLL:
    case 0xBBuLL:
    case 0xBCuLL:
    case 0xBDuLL:
    case 0xBEuLL:
    case 0xBFuLL:
    case 0xC0uLL:
    case 0xC1uLL:
    case 0xC2uLL:
    case 0xC3uLL:
    case 0xC4uLL:
    case 0xC5uLL:
    case 0xC6uLL:
    case 0xC7uLL:
    case 0xC8uLL:
    case 0xC9uLL:
    case 0xCAuLL:
    case 0xCBuLL:
    case 0xCCuLL:
    case 0xCDuLL:
    case 0xCEuLL:
    case 0xCFuLL:
    case 0xD0uLL:
    case 0xD1uLL:
    case 0xD2uLL:
    case 0xD3uLL:
    case 0xD4uLL:
    case 0xD5uLL:
    case 0xD6uLL:
    case 0xD7uLL:
    case 0xD8uLL:
    case 0xD9uLL:
    case 0xDAuLL:
    case 0xDBuLL:
    case 0xDCuLL:
    case 0xDDuLL:
    case 0xDEuLL:
    case 0xDFuLL:
    case 0xE0uLL:
    case 0xE1uLL:
    case 0xE2uLL:
    case 0xE3uLL:
    case 0xE4uLL:
    case 0xE5uLL:
    case 0xE6uLL:
    case 0xE7uLL:
    case 0xE8uLL:
    case 0xE9uLL:
    case 0xEAuLL:
    case 0xEBuLL:
    case 0xECuLL:
    case 0xEDuLL:
    case 0xEEuLL:
    case 0xEFuLL:
    case 0xF0uLL:
    case 0xF1uLL:
    case 0xF2uLL:
    case 0xF3uLL:
    case 0xF4uLL:
    case 0xF5uLL:
    case 0xF6uLL:
    case 0xF7uLL:
    case 0xF8uLL:
    case 0xF9uLL:
    case 0xFAuLL:
    case 0xFCuLL:
    case 0xFDuLL:
    case 0x100uLL:
    case 0x102uLL:
    case 0x104uLL:
    case 0x105uLL:
    case 0x107uLL:
    case 0x108uLL:
    case 0x109uLL:
    case 0x110uLL:
    case 0x111uLL:
    case 0x112uLL:
    case 0x113uLL:
    case 0x114uLL:
    case 0x115uLL:
    case 0x116uLL:
    case 0x11DuLL:
    case 0x11EuLL:
    case 0x11FuLL:
    case 0x120uLL:
    case 0x121uLL:
    case 0x122uLL:
    case 0x123uLL:
    case 0x124uLL:
    case 0x127uLL:
    case 0x128uLL:
    case 0x129uLL:
    case 0x12AuLL:
    case 0x12BuLL:
    case 0x12CuLL:
    case 0x12DuLL:
    case 0x12EuLL:
    case 0x12FuLL:
    case 0x132uLL:
    case 0x133uLL:
    case 0x134uLL:
    case 0x135uLL:
    case 0x138uLL:
    case 0x139uLL:
    case 0x13AuLL:
    case 0x13BuLL:
    case 0x13CuLL:
    case 0x13DuLL:
    case 0x13EuLL:
    case 0x13FuLL:
    case 0x140uLL:
    case 0x141uLL:
    case 0x142uLL:
    case 0x143uLL:
    case 0x144uLL:
    case 0x145uLL:
    case 0x146uLL:
    case 0x147uLL:
    case 0x148uLL:
    case 0x149uLL:
    case 0x14AuLL:
    case 0x14BuLL:
    case 0x14CuLL:
    case 0x14DuLL:
    case 0x14EuLL:
    case 0x14FuLL:
    case 0x150uLL:
    case 0x151uLL:
    case 0x152uLL:
    case 0x153uLL:
    case 0x154uLL:
    case 0x155uLL:
    case 0x156uLL:
    case 0x157uLL:
    case 0x158uLL:
    case 0x159uLL:
    case 0x15AuLL:
    case 0x15BuLL:
    case 0x15CuLL:
    case 0x15DuLL:
    case 0x15EuLL:
    case 0x15FuLL:
    case 0x160uLL:
    case 0x161uLL:
    case 0x162uLL:
    case 0x168uLL:
    case 0x169uLL:
    case 0x16AuLL:
    case 0x16BuLL:
    case 0x16CuLL:
    case 0x16DuLL:
    case 0x16EuLL:
    case 0x16FuLL:
    case 0x170uLL:
    case 0x171uLL:
    case 0x172uLL:
    case 0x173uLL:
    case 0x174uLL:
    case 0x175uLL:
    case 0x17AuLL:
    case 0x17BuLL:
    case 0x17CuLL:
    case 0x17DuLL:
    case 0x17EuLL:
    case 0x17FuLL:
    case 0x180uLL:
    case 0x185uLL:
    case 0x186uLL:
    case 0x187uLL:
    case 0x188uLL:
    case 0x189uLL:
    case 0x18AuLL:
    case 0x18BuLL:
    case 0x18CuLL:
    case 0x18DuLL:
    case 0x18EuLL:
    case 0x18FuLL:
    case 0x190uLL:
    case 0x191uLL:
    case 0x192uLL:
    case 0x193uLL:
    case 0x194uLL:
    case 0x195uLL:
    case 0x196uLL:
    case 0x197uLL:
    case 0x198uLL:
    case 0x199uLL:
    case 0x19AuLL:
    case 0x19BuLL:
    case 0x19CuLL:
    case 0x19DuLL:
    case 0x19EuLL:
    case 0x19FuLL:
    case 0x1A0uLL:
    case 0x1A1uLL:
    case 0x1A2uLL:
    case 0x1A3uLL:
    case 0x1A4uLL:
    case 0x1A5uLL:
    case 0x1A6uLL:
    case 0x1A7uLL:
    case 0x1A8uLL:
    case 0x1A9uLL:
    case 0x1AAuLL:
    case 0x1ABuLL:
    case 0x1ACuLL:
    case 0x1ADuLL:
    case 0x1AEuLL:
    case 0x1AFuLL:
    case 0x1B0uLL:
    case 0x1B1uLL:
    case 0x1B2uLL:
    case 0x1B3uLL:
    case 0x1B4uLL:
    case 0x1B5uLL:
    case 0x1B6uLL:
    case 0x1B7uLL:
    case 0x1B8uLL:
    case 0x1B9uLL:
    case 0x1BAuLL:
    case 0x1BBuLL:
    case 0x1BCuLL:
    case 0x1BDuLL:
    case 0x1BEuLL:
    case 0x1BFuLL:
    case 0x1C0uLL:
    case 0x1C1uLL:
    case 0x1C2uLL:
    case 0x1C3uLL:
    case 0x1C4uLL:
    case 0x1C5uLL:
    case 0x1C6uLL:
    case 0x1C7uLL:
    case 0x1C8uLL:
    case 0x1C9uLL:
    case 0x1CAuLL:
    case 0x1CBuLL:
    case 0x1CCuLL:
    case 0x1CDuLL:
    case 0x1CEuLL:
    case 0x1CFuLL:
    case 0x1D0uLL:
    case 0x1D1uLL:
    case 0x1D2uLL:
    case 0x1D3uLL:
    case 0x1D4uLL:
    case 0x1D5uLL:
    case 0x1D6uLL:
    case 0x1D7uLL:
    case 0x1D8uLL:
    case 0x1D9uLL:
    case 0x1DAuLL:
    case 0x1DBuLL:
    case 0x1DCuLL:
    case 0x1DDuLL:
    case 0x1DEuLL:
    case 0x1DFuLL:
    case 0x1E0uLL:
    case 0x1E1uLL:
    case 0x1E2uLL:
    case 0x1E3uLL:
    case 0x1E4uLL:
    case 0x1E5uLL:
    case 0x1E6uLL:
    case 0x1E7uLL:
    case 0x1E8uLL:
    case 0x1E9uLL:
    case 0x1EAuLL:
    case 0x1EBuLL:
    case 0x1ECuLL:
    case 0x1EDuLL:
    case 0x1EEuLL:
    case 0x1EFuLL:
    case 0x1F0uLL:
    case 0x1F1uLL:
    case 0x1F2uLL:
    case 0x1F3uLL:
    case 0x1F4uLL:
    case 0x1F5uLL:
    case 0x1F8uLL:
    case 0x1F9uLL:
    case 0x1FAuLL:
    case 0x1FBuLL:
    case 0x1FCuLL:
    case 0x1FDuLL:
    case 0x1FEuLL:
    case 0x1FFuLL:
    case 0x200uLL:
    case 0x201uLL:
    case 0x202uLL:
    case 0x203uLL:
    case 0x204uLL:
    case 0x205uLL:
    case 0x206uLL:
    case 0x207uLL:
    case 0x209uLL:
    case 0x20AuLL:
    case 0x20BuLL:
    case 0x20CuLL:
    case 0x20DuLL:
    case 0x20EuLL:
    case 0x20FuLL:
    case 0x210uLL:
    case 0x211uLL:
    case 0x212uLL:
    case 0x213uLL:
    case 0x214uLL:
    case 0x215uLL:
    case 0x216uLL:
    case 0x217uLL:
    case 0x218uLL:
    case 0x219uLL:
    case 0x21AuLL:
    case 0x21BuLL:
    case 0x21CuLL:
    case 0x21DuLL:
    case 0x21EuLL:
    case 0x21FuLL:
    case 0x220uLL:
    case 0x221uLL:
    case 0x222uLL:
    case 0x223uLL:
    case 0x224uLL:
    case 0x225uLL:
    case 0x226uLL:
    case 0x227uLL:
    case 0x229uLL:
    case 0x22AuLL:
    case 0x22BuLL:
    case 0x22CuLL:
    case 0x22DuLL:
    case 0x22EuLL:
    case 0x22FuLL:
    case 0x230uLL:
    case 0x231uLL:
    case 0x232uLL:
    case 0x233uLL:
    case 0x234uLL:
    case 0x235uLL:
    case 0x236uLL:
    case 0x237uLL:
    case 0x238uLL:
    case 0x239uLL:
    case 0x23AuLL:
    case 0x23BuLL:
    case 0x23CuLL:
    case 0x23DuLL:
    case 0x23EuLL:
    case 0x23FuLL:
    case 0x240uLL:
    case 0x241uLL:
    case 0x242uLL:
    case 0x243uLL:
    case 0x244uLL:
    case 0x245uLL:
    case 0x246uLL:
    case 0x247uLL:
    case 0x248uLL:
    case 0x249uLL:
    case 0x24AuLL:
    case 0x24BuLL:
    case 0x24CuLL:
    case 0x24DuLL:
    case 0x24EuLL:
    case 0x24FuLL:
    case 0x250uLL:
    case 0x251uLL:
    case 0x252uLL:
    case 0x253uLL:
    case 0x254uLL:
    case 0x255uLL:
    case 0x256uLL:
    case 0x257uLL:
    case 0x258uLL:
    case 0x259uLL:
    case 0x25AuLL:
    case 0x25BuLL:
    case 0x25CuLL:
    case 0x25DuLL:
    case 0x25EuLL:
    case 0x25FuLL:
    case 0x260uLL:
    case 0x261uLL:
    case 0x262uLL:
    case 0x263uLL:
    case 0x264uLL:
    case 0x265uLL:
    case 0x266uLL:
    case 0x267uLL:
    case 0x268uLL:
    case 0x269uLL:
    case 0x26AuLL:
    case 0x26BuLL:
    case 0x26CuLL:
    case 0x26DuLL:
    case 0x26EuLL:
    case 0x26FuLL:
    case 0x270uLL:
    case 0x271uLL:
    case 0x272uLL:
    case 0x273uLL:
    case 0x274uLL:
    case 0x275uLL:
    case 0x276uLL:
    case 0x277uLL:
    case 0x278uLL:
    case 0x279uLL:
    case 0x27AuLL:
    case 0x27BuLL:
    case 0x27CuLL:
    case 0x27DuLL:
    case 0x27EuLL:
    case 0x27FuLL:
    case 0x280uLL:
    case 0x281uLL:
    case 0x282uLL:
    case 0x283uLL:
    case 0x284uLL:
    case 0x285uLL:
    case 0x286uLL:
    case 0x287uLL:
    case 0x288uLL:
    case 0x289uLL:
    case 0x28AuLL:
    case 0x28BuLL:
    case 0x28CuLL:
    case 0x28DuLL:
    case 0x28EuLL:
    case 0x28FuLL:
    case 0x290uLL:
    case 0x291uLL:
    case 0x292uLL:
    case 0x293uLL:
    case 0x294uLL:
    case 0x295uLL:
    case 0x296uLL:
    case 0x297uLL:
    case 0x298uLL:
    case 0x299uLL:
    case 0x2A1uLL:
    case 0x2A2uLL:
    case 0x2A3uLL:
    case 0x2A4uLL:
    case 0x2A5uLL:
    case 0x2A6uLL:
    case 0x2A7uLL:
    case 0x2A8uLL:
    case 0x2A9uLL:
    case 0x2AAuLL:
    case 0x2ABuLL:
    case 0x2ACuLL:
    case 0x2ADuLL:
    case 0x2AEuLL:
    case 0x2AFuLL:
    case 0x2B0uLL:
    case 0x2B1uLL:
    case 0x2B2uLL:
    case 0x2B3uLL:
    case 0x2B4uLL:
    case 0x2B5uLL:
    case 0x2B6uLL:
    case 0x2B7uLL:
    case 0x2B8uLL:
    case 0x2B9uLL:
    case 0x2BAuLL:
    case 0x2BBuLL:
    case 0x2BCuLL:
    case 0x2BDuLL:
    case 0x2BEuLL:
    case 0x2BFuLL:
    case 0x2C0uLL:
    case 0x2C1uLL:
    case 0x2C2uLL:
    case 0x2C3uLL:
    case 0x2C4uLL:
    case 0x2C5uLL:
    case 0x2C6uLL:
    case 0x2C7uLL:
    case 0x2C8uLL:
    case 0x2C9uLL:
    case 0x2CAuLL:
    case 0x2CBuLL:
    case 0x2CCuLL:
    case 0x2CDuLL:
    case 0x2CEuLL:
    case 0x2CFuLL:
    case 0x2D0uLL:
    case 0x2D1uLL:
    case 0x2D2uLL:
    case 0x2D3uLL:
    case 0x2D4uLL:
    case 0x2D5uLL:
    case 0x2D6uLL:
    case 0x2D7uLL:
    case 0x2D8uLL:
    case 0x2D9uLL:
    case 0x2DAuLL:
    case 0x2DBuLL:
    case 0x2DCuLL:
    case 0x2DDuLL:
    case 0x2DEuLL:
    case 0x2DFuLL:
    case 0x2E0uLL:
    case 0x2E1uLL:
    case 0x2E2uLL:
    case 0x2E3uLL:
    case 0x2E4uLL:
    case 0x2E5uLL:
    case 0x2E6uLL:
    case 0x2E7uLL:
    case 0x2E8uLL:
    case 0x2E9uLL:
    case 0x2EAuLL:
    case 0x2EBuLL:
    case 0x2ECuLL:
    case 0x2EDuLL:
    case 0x2EEuLL:
    case 0x2EFuLL:
    case 0x2F0uLL:
    case 0x2F1uLL:
    case 0x2F2uLL:
    case 0x2F3uLL:
    case 0x2F4uLL:
    case 0x2F5uLL:
    case 0x2F6uLL:
    case 0x2F7uLL:
    case 0x2F8uLL:
    case 0x2F9uLL:
    case 0x2FAuLL:
    case 0x2FBuLL:
    case 0x2FCuLL:
    case 0x2FDuLL:
    case 0x2FEuLL:
    case 0x2FFuLL:
    case 0x300uLL:
    case 0x302uLL:
    case 0x303uLL:
    case 0x304uLL:
    case 0x305uLL:
    case 0x306uLL:
    case 0x307uLL:
    case 0x308uLL:
    case 0x309uLL:
    case 0x30AuLL:
    case 0x30BuLL:
    case 0x30CuLL:
    case 0x30DuLL:
    case 0x30EuLL:
    case 0x30FuLL:
    case 0x310uLL:
    case 0x311uLL:
    case 0x312uLL:
    case 0x313uLL:
    case 0x314uLL:
    case 0x315uLL:
    case 0x316uLL:
    case 0x317uLL:
    case 0x318uLL:
    case 0x319uLL:
    case 0x31AuLL:
    case 0x31BuLL:
    case 0x31CuLL:
    case 0x31DuLL:
    case 0x31EuLL:
    case 0x31FuLL:
    case 0x320uLL:
    case 0x321uLL:
    case 0x322uLL:
    case 0x323uLL:
    case 0x324uLL:
    case 0x325uLL:
    case 0x326uLL:
    case 0x327uLL:
    case 0x329uLL:
    case 0x32AuLL:
    case 0x32BuLL:
    case 0x32CuLL:
    case 0x330uLL:
      double result = 10000.0;
      break;
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0x33uLL:
    case 0x3BuLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x40uLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x45uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x4AuLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x5FuLL:
    case 0x60uLL:
    case 0x65uLL:
    case 0x66uLL:
    case 0x67uLL:
    case 0x68uLL:
    case 0x69uLL:
    case 0x6AuLL:
    case 0x6BuLL:
    case 0x6CuLL:
    case 0x6DuLL:
    case 0x6EuLL:
    case 0x7EuLL:
    case 0x7FuLL:
    case 0x80uLL:
    case 0x84uLL:
    case 0x85uLL:
    case 0x86uLL:
    case 0x87uLL:
    case 0x93uLL:
    case 0x94uLL:
    case 0x95uLL:
    case 0x96uLL:
    case 0x97uLL:
    case 0x98uLL:
    case 0x99uLL:
    case 0x9AuLL:
    case 0x9BuLL:
    case 0x9CuLL:
    case 0xB4uLL:
    case 0xB5uLL:
    case 0xB6uLL:
    case 0xB7uLL:
    case 0xB8uLL:
    case 0xB9uLL:
    case 0xBAuLL:
    case 0xFBuLL:
    case 0xFEuLL:
    case 0xFFuLL:
    case 0x101uLL:
    case 0x103uLL:
    case 0x106uLL:
    case 0x10AuLL:
    case 0x10BuLL:
    case 0x10CuLL:
    case 0x10DuLL:
    case 0x10EuLL:
    case 0x10FuLL:
    case 0x117uLL:
    case 0x118uLL:
    case 0x119uLL:
    case 0x11AuLL:
    case 0x11BuLL:
    case 0x11CuLL:
    case 0x125uLL:
    case 0x126uLL:
    case 0x130uLL:
    case 0x131uLL:
    case 0x136uLL:
    case 0x137uLL:
    case 0x163uLL:
    case 0x164uLL:
    case 0x165uLL:
    case 0x166uLL:
    case 0x167uLL:
    case 0x176uLL:
    case 0x177uLL:
    case 0x178uLL:
    case 0x179uLL:
    case 0x181uLL:
    case 0x182uLL:
    case 0x183uLL:
    case 0x184uLL:
    case 0x1F6uLL:
    case 0x1F7uLL:
    case 0x208uLL:
    case 0x228uLL:
    case 0x29AuLL:
    case 0x29BuLL:
    case 0x29CuLL:
    case 0x29DuLL:
    case 0x29EuLL:
    case 0x29FuLL:
    case 0x2A0uLL:
    case 0x301uLL:
    case 0x328uLL:
    case 0x32DuLL:
    case 0x32EuLL:
    case 0x32FuLL:
      return result;
    case 0x331uLL:
      goto LABEL_5;
    default:
      if (a3 == 0xFFFFFFFF) {
LABEL_5:
      }
        double result = 0.0;
      break;
  }
  return result;
}

+ (id)subscoresWithDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v23 = (id)objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    v8 = off_1E68AA000;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
        uint64_t v11 = [v10 rangeOfString:@"_ATXScoreInput"];
        int v12 = v8[406];
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [NSString stringWithFormat:@"_ATXScoreInput%@", v10];
          v14 = v13 = v8;
          uint64_t v15 = [(__objc2_class *)v12 scoreInputForString:v14];

          v8 = v13;
        }
        else
        {
          uint64_t v15 = [(__objc2_class *)v8[406] scoreInputForString:v10];
        }
        if (v15 != 817 && v15 != 0xFFFFFFFFLL)
        {
          v17 = [v4 objectForKeyedSubscript:v10];
          [v17 doubleValue];
          double v19 = v18;

          if (v19 != -31337.0)
          {
            uint64_t v20 = +[ATXAWDUtils awdScoreWithScore:v15 type:v19];
            switch(v15)
            {
              case 0:
                [v23 setInstallAge:v20];
                break;
              case 1:
                [v23 setLastSpotlightLaunchAge:v20];
                break;
              case 2:
                [v23 setLastLaunchAge:v20];
                break;
              case 3:
                [v23 setMedianSecondsBetweenLaunches:v20];
                break;
              case 4:
                [v23 setAverageSecondsBetweenLaunches:v20];
                break;
              case 5:
                [v23 setUnlockTime:v20];
                break;
              case 6:
                [v23 setAppInFolder:v20];
                break;
              case 7:
                [v23 setFolderPage:v20];
                break;
              case 9:
                [v23 setSpringBoardPage:v20];
                break;
              case 10:
                [v23 setOnSpringBoardDock:v20];
                break;
              case 11:
                [v23 setFeedback:v20];
                break;
              case 12:
                [v23 setFeedbackConfirms:v20];
                break;
              case 13:
                [v23 setFeedbackRejects:v20];
                break;
              case 26:
                [v23 setLaunchTimePopularity:v20];
                break;
              case 27:
                [v23 setTimeOfDayPopularity:v20];
                break;
              case 28:
                [v23 setCoarseTimeOfDayPopularity:v20];
                break;
              case 29:
                [v23 setLaunchPopularity:v20];
                break;
              case 30:
                [v23 setSpotlightLaunchTimePopularity:v20];
                break;
              case 31:
                [v23 setSpotlightTimeOfDayPopularity:v20];
                break;
              case 32:
                [v23 setSpotlightLaunchPopularity:v20];
                break;
              case 33:
                [v23 setDayZeroPoints:v20];
                break;
              case 34:
                [v23 setStaticAppPoints:v20];
                break;
              case 35:
                [v23 setLaunchDayOfWeekPopularity:v20];
                break;
              case 36:
                [v23 setDayOfWeekPopularity:v20];
                break;
              case 37:
                [v23 setLaunchSequencePopularity:v20];
                break;
              case 38:
                [v23 setLaunchLocationPopularity:v20];
                break;
              case 39:
                [v23 setAppLaunchMicroLocationPopularity:v20];
                break;
              case 40:
                [v23 setEntropyLaunchPopularity:v20];
                break;
              case 41:
                [v23 setEntropyDayOfWeekPopularity:v20];
                break;
              case 42:
                [v23 setEntropyDayOfWeekPopularityByDay:v20];
                break;
              case 43:
                [v23 setEntropyDayOfWeekPopularityByApp:v20];
                break;
              case 44:
                [v23 setDistanceDayOfWeekToLaunchPopularity:v20];
                break;
              case 45:
                [v23 setEntropyTrendingPopularity:v20];
                break;
              case 46:
                [v23 setDistanceTrendingToLaunchPopularity:v20];
                break;
              case 47:
                [v23 setEntropySSIDPopularity:v20];
                break;
              case 48:
                [v23 setEntropySSIDPopularityBySSID:v20];
                break;
              case 49:
                [v23 setEntropySSIDPopularityByApp:v20];
                break;
              case 50:
                [v23 setDistanceSSIDToLaunchPopularity:v20];
                break;
              case 51:
                [v23 setAppCount:v20];
                break;
              case 52:
                [v23 setDistanceToExplicitLaunchPrediction:v20];
                break;
              case 53:
                [v23 setSiriKitIntentParzen:v20];
                break;
              case 54:
                [v23 setNonSiriKitIntentParzen:v20];
                break;
              case 55:
                [v23 setAppDailyDose:v20];
                break;
              case 56:
                [v23 setCurrentDose:v20];
                break;
              case 57:
                [v23 setAppDailyDoseRemaining:v20];
                break;
              case 58:
                [v23 setAppDailyDoseSmoothedError:v20];
                break;
              case 59:
                [v23 setTotalNumberOfLaunches:v20];
                break;
              case 60:
                [v23 setTotalNumberOfSpotlightLaunches:v20];
                break;
              case 61:
                [v23 setAirplaneModePopularity:v20];
                break;
              case 62:
                [v23 setTotalNumberOfAirplaneModeLaunches:v20];
                break;
              case 63:
                [v23 setTrendingPopularity:v20];
                break;
              case 64:
                [v23 setTotalNumberOfTrendingLaunches:v20];
                break;
              case 65:
                [v23 setSSIDPopularity:v20];
                break;
              case 66:
                [v23 setTotalNumberOfSSIDLaunches:v20];
                break;
              case 67:
                [v23 setOnWifi:v20];
                break;
              case 68:
                [v23 setCoreMotionPopularity:v20];
                break;
              case 69:
                [v23 setTotalNumberOfCoreMotionLaunches:v20];
                break;
              case 70:
                [v23 setMagicalMomentsConfidence:v20];
                break;
              case 71:
                [v23 setMagicalMomentsPredictionReason:v20];
                break;
              case 73:
                [v23 setHeroAppConfidence:v20];
                break;
              case 74:
                [v23 setHeroAppPredictionReason:v20];
                break;
              case 75:
                [v23 setMagicalMomentsHeroAppPredictionIndex:v20];
                break;
              case 76:
                [v23 setMagicalMomentsHeroAppPredictionTotalPredictions:v20];
                break;
              case 77:
                [v23 setMostRecentNotificationAge:v20];
                break;
              case 78:
                [v23 setAppPreferenceBundleBoost:v20];
                break;
              case 79:
                [v23 setAppIntentPartOfWeekPopularity:v20];
                break;
              case 80:
                [v23 setAppIntentLaunchPartOfWeekPopularity:v20];
                break;
              case 81:
                [v23 setGenreTimeOfDayPopularity:v20];
                break;
              case 82:
                [v23 setGenreSequencePopularity:v20];
                break;
              case 83:
                [v23 setGenreDayOfWeekPopularity:v20];
                break;
              case 84:
                [v23 setGenreSpotlightLaunchPopularity:v20];
                break;
              case 85:
                [v23 setTrendingGenrePopularity:v20];
                break;
              case 86:
                [v23 setGenreAirplaneModePopularity:v20];
                break;
              case 87:
                [v23 setGenreDailyDoseRemaining:v20];
                break;
              case 88:
                [v23 setGenreLocationPopularity:v20];
                break;
              case 89:
                [v23 setGenreSSIDPopularity:v20];
                break;
              case 90:
                [v23 setApp2VecClusterTimeOfDayPopularity:v20];
                break;
              case 91:
                [v23 setApp2VecClusterSequencePopularity:v20];
                break;
              case 92:
                [v23 setApp2VecClusterDayOfWeekPopularity:v20];
                break;
              case 93:
                [v23 setApp2VecClusterTrendingPopularity:v20];
                break;
              case 94:
                [v23 setApp2VecClusterLocationPopularity:v20];
                break;
              case 95:
                [v23 setApp2VecClusterCount:v20];
                break;
              case 96:
                [v23 setSupportsMedia:v20];
                break;
              case 97:
                [v23 setAppTimeAndDayOfWeekPopularity:v20];
                break;
              case 98:
                [v23 setAppPopularityGivenTimeAndDayOfWeek:v20];
                break;
              case 99:
                [v23 setAppPopularityOfTimeAndDayOfWeekGivenApp:v20];
                break;
              case 100:
                [v23 setAppTotalNumberOfTimeAndDayOfWeekLaunches:v20];
                break;
              case 101:
                [v23 setAppIntentCount:v20];
                break;
              case 102:
                [v23 setAppIntentSlotCountForAllAppActions:v20];
                break;
              case 103:
                [v23 setAppIntentTotalNumberOfLaunches:v20];
                break;
              case 104:
                [v23 setAppIntentTotalNumberOfAirplaneModeLaunches:v20];
                break;
              case 105:
                [v23 setAppIntentTotalNumberOfSSIDLaunches:v20];
                break;
              case 106:
                [v23 setAppIntentTotalNumberOfCoreMotionLaunches:v20];
                break;
              case 107:
                [v23 setAppIntentTotalNumberOfTrendingLaunches:v20];
                break;
              case 108:
                [v23 setDayOfWeekBucket:v20];
                break;
              case 109:
                [v23 setTimeOfDayBucket:v20];
                break;
              case 110:
                [v23 setIsDateInWeekendOnDevice:v20];
                break;
              case 111:
                [v23 setAppIntentLaunchPopularity:v20];
                break;
              case 112:
                [v23 setAppIntentTrendingPopularity:v20];
                break;
              case 113:
                [v23 setAppIntentTimeOfDayPopularity:v20];
                break;
              case 114:
                [v23 setAppIntentCoarseTimeOfDayPopularity:v20];
                break;
              case 115:
                [v23 setAppIntentDayOfWeekPopularity:v20];
                break;
              case 116:
                [v23 setAppIntentUnlockTime:v20];
                break;
              case 117:
                [v23 setAppIntentSSIDPopularity:v20];
                break;
              case 118:
                [v23 setAppIntentCoreMotionPopularity:v20];
                break;
              case 119:
                [v23 setAppIntentAirplaneModePopularity:v20];
                break;
              case 120:
                [v23 setAppIntentLaunchLocationPopularity:v20];
                break;
              case 121:
                [v23 setAppIntentLaunchMicroLocationPopularity:v20];
                break;
              case 122:
                [v23 setAppIntentLaunchSequencePopularity:v20];
                break;
              case 123:
                [v23 setAppIntentAppLaunchSequencePopularity:v20];
                break;
              case 124:
                [v23 setAppIntentLaunchTimePopularity:v20];
                break;
              case 125:
                [v23 setAppIntentLaunchDayOfWeekPopularity:v20];
                break;
              case 126:
                [v23 setAppIntentLastLaunchAge:v20];
                break;
              case 127:
                [v23 setAppIntentAverageSecondsBetweenAppActions:v20];
                break;
              case 128:
                [v23 setAppIntentMedianSecondsBetweenAppActions:v20];
                break;
              case 129:
                [v23 setAppIntentDayZeroPoints:v20];
                break;
              case 130:
                [v23 setAppIntentStaticPoints:v20];
                break;
              case 131:
                [v23 setAppIntentValueScore:v20];
                break;
              case 132:
                [v23 setAppCategory:v20];
                break;
              case 135:
                [v23 setIntentCategoryFromIntentDefinition:v20];
                break;
              case 136:
                [v23 setAppIntentEntropyLaunchPopularity:v20];
                break;
              case 137:
                [v23 setAppIntentEntropyDayOfWeekPopularity:v20];
                break;
              case 138:
                [v23 setAppIntentEntropyDayOfWeekPopularityByDay:v20];
                break;
              case 139:
                [v23 setAppIntentEntropyDayOfWeekPopularityByAppIntent:v20];
                break;
              case 140:
                [v23 setAppIntentEntropyTrendingPopularity:v20];
                break;
              case 141:
                [v23 setAppIntentEntropySSIDPopularity:v20];
                break;
              case 142:
                [v23 setAppIntentEntropySSIDPopularityBySSID:v20];
                break;
              case 143:
                [v23 setAppIntentEntropySSIDPopularityByAppIntent:v20];
                break;
              case 144:
                [v23 setAppIntentDistanceDayOfWeekToLaunchPopularity:v20];
                break;
              case 145:
                [v23 setAppIntentDistanceTrendingToLaunchPopularity:v20];
                break;
              case 146:
                [v23 setAppIntentDistanceSSIDToLaunchPopularity:v20];
                break;
              case 147:
                [v23 setAppActionConfirmEvents:v20];
                break;
              case 148:
                [v23 setAppActionRejectEvents:v20];
                break;
              case 149:
                [v23 setTotalAppActionConfirmEvents:v20];
                break;
              case 150:
                [v23 setTotalAppActionRejectEvents:v20];
                break;
              case 151:
                [v23 setAppForAllIntentsCount:v20];
                break;
              case 152:
                [v23 setAppForAllIntentsTotalNumberOfLaunches:v20];
                break;
              case 153:
                [v23 setAppForAllIntentsTotalNumberOfAirplaneModeLaunches:v20];
                break;
              case 154:
                [v23 setAppForAllIntentsTotalNumberOfSSIDLaunches:v20];
                break;
              case 155:
                [v23 setAppForAllIntentsTotalNumberOfCoreMotionLaunches:v20];
                break;
              case 156:
                [v23 setAppForAllIntentsTotalNumberOfTrendingLaunches:v20];
                break;
              case 157:
                [v23 setAppForAllIntentsLaunchPopularity:v20];
                break;
              case 158:
                [v23 setAppForAllIntentsTimeOfDayPopularity:v20];
                break;
              case 159:
                [v23 setAppForAllIntentsDayOfWeekPopularity:v20];
                break;
              case 160:
                [v23 setAppForAllIntentsCoarseTimeOfDayPopularity:v20];
                break;
              case 161:
                [v23 setAppForAllIntentsUnlockTime:v20];
                break;
              case 162:
                [v23 setAppForAllIntentsAirplaneModePopularity:v20];
                break;
              case 163:
                [v23 setAppForAllIntentsSSIDPopularity:v20];
                break;
              case 164:
                [v23 setAppForAllIntentsCoreMotionPopularity:v20];
                break;
              case 165:
                [v23 setAppForAllIntentsTrendingPopularity:v20];
                break;
              case 166:
                [v23 setAppForAllIntentsLaunchLocationPopularity:v20];
                break;
              case 167:
                [v23 setAppForAllIntentsLaunchTimePopularity:v20];
                break;
              case 168:
                [v23 setAppForAllIntentsLaunchDayOfWeekPopularity:v20];
                break;
              case 169:
                [v23 setAppForAllIntentsEntropyLaunchPopularity:v20];
                break;
              case 170:
                [v23 setAppForAllIntentsEntropyDayOfWeekPopularity:v20];
                break;
              case 171:
                [v23 setAppForAllIntentsEntropyDayOfWeekPopularityByDay:v20];
                break;
              case 172:
                [v23 setAppForAllIntentsEntropyDayOfWeekPopularityByApp:v20];
                break;
              case 173:
                [v23 setAppForAllIntentsEntropyTrendingPopularity:v20];
                break;
              case 174:
                [v23 setAppForAllIntentsEntropySSIDPopularity:v20];
                break;
              case 175:
                [v23 setAppForAllIntentsEntropySSIDPopularityBySSID:v20];
                break;
              case 176:
                [v23 setAppForAllIntentsEntropySSIDPopularityByApp:v20];
                break;
              case 177:
                [v23 setAppForAllIntentsDistanceSSIDToLaunchPopularity:v20];
                break;
              case 178:
                [v23 setAppForAllIntentsDistanceDayOfWeekToLaunchPopularity:v20];
                break;
              case 179:
                [v23 setAppForAllIntentsDistanceTrendingToLaunchPopularity:v20];
                break;
              case 180:
                [v23 setAppForAllActionsConfirmEvents:v20];
                break;
              case 181:
                [v23 setAppForAllActionsRejectEvents:v20];
                break;
              case 182:
                [v23 setTotalAppForAllActionsConfirmEvents:v20];
                break;
              case 183:
                [v23 setTotalAppForAllActionsRejectEvents:v20];
                break;
              case 184:
                [v23 setSlotCount:v20];
                break;
              case 185:
                [v23 setSlotTotalNumberOfLaunches:v20];
                break;
              case 186:
                [v23 setSlotTotalNumberOfUniqueDaysLaunched:v20];
                break;
              case 187:
                [v23 setSlotLaunchPopularity:v20];
                break;
              case 188:
                [v23 setSlotTimeOfDayPopularity:v20];
                break;
              case 189:
                [v23 setSlotTimeOfDayWithThirtyMinuteWindowPopularity:v20];
                break;
              case 190:
                [v23 setSlotTimeOfDayWithHourWindowPopularity:v20];
                break;
              case 191:
                [v23 setSlotTimeOfDayWithEightHourWindowPopularity:v20];
                break;
              case 192:
                [v23 setSlotDayOfWeekPopularity:v20];
                break;
              case 193:
                [v23 setSlotPartOfWeekPopularity:v20];
                break;
              case 194:
                [v23 setSlotPartOfWeekAndLocationPopularity:v20];
                break;
              case 195:
                [v23 setSlotCoarseTimeOfDayPopularity:v20];
                break;
              case 196:
                [v23 setSlotLocationPopularity:v20];
                break;
              case 197:
                [v23 setSlotCoreMotionPopularity:v20];
                break;
              case 198:
                [v23 setSlotPreviousLocationPopularity:v20];
                break;
              case 199:
                [v23 setSlotTimeAndDayPopularity:v20];
                break;
              case 200:
                [v23 setSlotTimeAndLocationPopularity:v20];
                break;
              case 201:
                [v23 setSlotDayAndLocationPopularity:v20];
                break;
              case 202:
                [v23 setSlotTimeAndDayAndLocationPopularity:v20];
                break;
              case 203:
                [v23 setSlotPreviousLocationAndCoreMotionPopularity:v20];
                break;
              case 204:
                [v23 setSlotPreviousLocationAndLocationPopularity:v20];
                break;
              case 205:
                [v23 setSlotTimeAndPreviousLocationPopularity:v20];
                break;
              case 206:
                [v23 setSlotDayAndPreviousLocationPopularity:v20];
                break;
              case 207:
                [v23 setSlotPartOfWeekAndTimePopularity:v20];
                break;
              case 208:
                [v23 setSlotLaunchTimePopularity:v20];
                break;
              case 209:
                [v23 setSlotLaunchCoarseTimePopularity:v20];
                break;
              case 210:
                [v23 setSlotLaunchDayOfWeekPopularity:v20];
                break;
              case 211:
                [v23 setSlotLaunchPartOfWeekPopularity:v20];
                break;
              case 212:
                [v23 setSlotLaunchPartOfWeekAndLocationPopularity:v20];
                break;
              case 213:
                [v23 setSlotLaunchLocationPopularity:v20];
                break;
              case 214:
                [v23 setSlotLaunchCoreMotionPopularity:v20];
                break;
              case 215:
                [v23 setSlotLaunchPreviousLocationPopularity:v20];
                break;
              case 216:
                [v23 setSlotLaunchTimeAndDayPopularity:v20];
                break;
              case 217:
                [v23 setSlotLaunchTimeAndLocationPopularity:v20];
                break;
              case 218:
                [v23 setSlotLaunchDayAndLocationPopularity:v20];
                break;
              case 219:
                [v23 setSlotLaunchTimeAndDayAndLocationPopularity:v20];
                break;
              case 220:
                [v23 setSlotLaunchPreviousLocationAndCoreMotionPopularity:v20];
                break;
              case 221:
                [v23 setSlotLaunchPreviousLocationAndLocationPopularity:v20];
                break;
              case 222:
                [v23 setSlotLaunchTimeAndPreviousLocationPopularity:v20];
                break;
              case 223:
                [v23 setSlotLaunchDayAndPreviousLocationPopularity:v20];
                break;
              case 224:
                [v23 setSlotLaunchPartOfWeekAndTimePopularity:v20];
                break;
              case 225:
                [v23 setSlotLaunchTimeCount:v20];
                break;
              case 226:
                [v23 setSlotLaunchDayOfWeekCount:v20];
                break;
              case 227:
                [v23 setSlotLaunchPartOfWeekCount:v20];
                break;
              case 228:
                [v23 setSlotLaunchCoarseTimeCount:v20];
                break;
              case 229:
                [v23 setSlotLaunchTimeWithThirtyMinuteWindowCount:v20];
                break;
              case 230:
                [v23 setSlotLaunchTimeWithHourWindowCount:v20];
                break;
              case 231:
                [v23 setSlotLaunchTimeWithEightHourWindowCount:v20];
                break;
              case 232:
                [v23 setSlotLaunchLocationCount:v20];
                break;
              case 233:
                [v23 setSlotLaunchCoreMotionCount:v20];
                break;
              case 234:
                [v23 setSlotLaunchPreviousLocationCount:v20];
                break;
              case 235:
                [v23 setTotalLaunchesForSlotUsingTimeDecay:v20];
                break;
              case 236:
                [v23 setTotalLaunchesForSlotUsingDayOfWeekDecay:v20];
                break;
              case 237:
                [v23 setTotalLaunchesForSlotUsingLocationDecay:v20];
                break;
              case 238:
                [v23 setTotalLaunchesForSlotUsingCoreMotionDecay:v20];
                break;
              case 239:
                [v23 setTotalLaunchesForSlotUsingPreviousLocationDecay:v20];
                break;
              case 240:
                [v23 setTotalLaunchesForSlotUsingPartOfWeekDecay:v20];
                break;
              case 241:
                [v23 setTotalLaunchesForSlotUsingTimeAndDayDecay:v20];
                break;
              case 242:
                [v23 setTotalLaunchesForSlotUsingTimeAndLocationDecay:v20];
                break;
              case 243:
                [v23 setTotalLaunchesForSlotUsingDayAndLocationDecay:v20];
                break;
              case 244:
                [v23 setTotalLaunchesForSlotUsingTimeAndDayAndLocationDecay:v20];
                break;
              case 245:
                [v23 setTotalLaunchesForSlotUsingPreviousLocationAndLocationDecay:v20];
                break;
              case 246:
                [v23 setTotalLaunchesForSlotUsingPreviousLocationAndCoreMotionDecay:v20];
                break;
              case 247:
                [v23 setTotalLaunchesForSlotUsingTimeAndPreviousLocationDecay:v20];
                break;
              case 248:
                [v23 setTotalLaunchesForSlotUsingDayAndPreviousLocationDecay:v20];
                break;
              case 249:
                [v23 setTotalLaunchesForSlotUsingPartOfWeekAndLocationDecay:v20];
                break;
              case 250:
                [v23 setTotalLaunchesForSlotUsingPartOfWeekAndTimeDecay:v20];
                break;
              case 251:
                [v23 setSlotSecondsSinceLastSlot:v20];
                break;
              case 252:
                [v23 setSlotOnlyLaunchedWithinShortTimeSpan:v20];
                break;
              case 253:
                [v23 setSlotTotalNumberOfUndecayedLaunchesForSlot:v20];
                break;
              case 254:
                [v23 setSlotNumberOfUniqueDaysLaunchedForSlot:v20];
                break;
              case 255:
                [v23 setSlotTotalNumberOfLaunchesForSlot:v20];
                break;
              case 256:
                [v23 setSlotLOIBoost:v20];
                break;
              case 257:
                [v23 setSlotNumberOfParameters:v20];
                break;
              case 258:
                [v23 setSlotNumSessionStartsForRootOfApp:v20];
                break;
              case 259:
                [v23 setSlotTotalNumSessionsForRootOfApp:v20];
                break;
              case 260:
                [v23 setSlotNumDocFreqForRootOfApp:v20];
                break;
              case 261:
                [v23 setSlotEntropyForSlotSet:v20];
                break;
              case 262:
                [v23 setSlotTotalNumberOfLaunchesForSlotSet:v20];
                break;
              case 263:
                [v23 setSlotTimeOfDayBudgetMeanForSlot:v20];
                break;
              case 264:
                [v23 setSlotTimeOfDayBudgetStdDevForSlot:v20];
                break;
              case 265:
                [v23 setSlotTodaysTimeOfDayBudgetForSlot:v20];
                break;
              case 266:
                [v23 setSlotFeedbackTotalConfirmsForSlot:v20];
                break;
              case 267:
                [v23 setSlotFeedbackTotalRejectsForSlot:v20];
                break;
              case 268:
                [v23 setSlotFeedbackTotalExplicitRejectsForSlotNoDecay:v20];
                break;
              case 269:
                [v23 setSlotFeedbackTotalConfirmsForAllSlots:v20];
                break;
              case 270:
                [v23 setSlotFeedbackTotalRejectsForAllSlots:v20];
                break;
              case 271:
                [v23 setSlotFeedbackTotalExplicitRejectsForAllSlotsNoDecay:v20];
                break;
              case 272:
                [v23 setSlotFeedbackConfirmRatio:v20];
                break;
              case 273:
                [v23 setSlotFeedbackConfirmRatioStdDev:v20];
                break;
              case 274:
                [v23 setSlotFeedbackConfirmRatioMean:v20];
                break;
              case 275:
                [v23 setSlotFeedbackConfirmRatioCount:v20];
                break;
              case 276:
                [v23 setSlotFeedbackMinutesSinceLastExplicitRejectInHomeScreen:v20];
                break;
              case 277:
                [v23 setSlotFeedbackMinutesSinceLastConfirmInSpotlight:v20];
                break;
              case 278:
                [v23 setSlotFeedbackMinutesSinceLastExplicitRejectInSpotlight:v20];
                break;
              case 279:
                [v23 setSlotFeedbackTotalConfirmsForSlotInLastHourInSpotlight:v20];
                break;
              case 280:
                [v23 setSlotFeedbackTotalRejectsForSlotInLastHourInSpotlight:v20];
                break;
              case 281:
                [v23 setSlotFeedbackTotalConfirmsForSlotInLastTwoHoursInSpotlight:v20];
                break;
              case 282:
                [v23 setSlotFeedbackTotalRejectsForSlotInLastTwoHoursInSpotlight:v20];
                break;
              case 283:
                [v23 setSlotFeedbackTotalConfirmsForSlotTodayInSpotlight:v20];
                break;
              case 284:
                [v23 setSlotFeedbackTotalRejectsForSlotTodayInSpotlight:v20];
                break;
              case 285:
                [v23 setSlotFeedbackTotalConfirmsForSlotInSpotlight:v20];
                break;
              case 286:
                [v23 setSlotFeedbackTotalRejectsForSlotInSpotlight:v20];
                break;
              case 287:
                [v23 setSlotFeedbackConfirmsPartOfWeekCountInSpotlight:v20];
                break;
              case 288:
                [v23 setSlotFeedbackConfirmsDayCountInSpotlight:v20];
                break;
              case 289:
                [v23 setSlotFeedbackConfirmsTimeOfDayCountInSpotlight:v20];
                break;
              case 290:
                [v23 setSlotFeedbackConfirmsCoarseTimeOfDayCountInSpotlight:v20];
                break;
              case 291:
                [v23 setSlotFeedbackTotalConfirmsInSpotlightForAllSlots:v20];
                break;
              case 292:
                [v23 setSlotFeedbackTotalRejectsInSpotlightForAllSlots:v20];
                break;
              case 293:
                [v23 setSlotFeedbackTotalConfirmsForSlotTodayInLockscreen:v20];
                break;
              case 294:
                [v23 setSlotFeedbackTotalRejectsForSlotTodayInLockscreen:v20];
                break;
              case 295:
                [v23 setSlotFeedbackMinutesSinceLastConfirmInLockscreen:v20];
                break;
              case 296:
                [v23 setSlotFeedbackMinutesSinceLastRejectInLockscreen:v20];
                break;
              case 297:
                [v23 setSlotFeedbackMinutesSinceLastExplicitRejectInLockscreen:v20];
                break;
              case 298:
                [v23 setSlotFeedbackTotalConfirmsForSlotInLockscreen:v20];
                break;
              case 299:
                [v23 setSlotFeedbackTotalRejectsForSlotInLockscreen:v20];
                break;
              case 300:
                [v23 setSlotFeedbackConfirmsPartOfWeekCountInLockscreen:v20];
                break;
              case 301:
                [v23 setSlotFeedbackConfirmsDayCountInLockscreen:v20];
                break;
              case 302:
                [v23 setSlotFeedbackConfirmsTimeOfDayCountInLockscreen:v20];
                break;
              case 303:
                [v23 setSlotFeedbackConfirmsCoarseTimeOfDayCountInLockscreen:v20];
                break;
              case 304:
                [v23 setSlotFeedbackTotalConfirmsTodayInLockscreenForAllSlots:v20];
                break;
              case 305:
                [v23 setSlotFeedbackTotalRejectsTodayInLockscreenForAllSlots:v20];
                break;
              case 306:
                [v23 setSlotFeedbackTotalConfirmsInLockscreenForAllSlots:v20];
                break;
              case 307:
                [v23 setSlotFeedbackTotalRejectsInLockscreenForAllSlots:v20];
                break;
              case 308:
                [v23 setActionFeedbackTotalConfirmsInSpotlight:v20];
                break;
              case 309:
                [v23 setActionFeedbackTotalRejectsInSpotlight:v20];
                break;
              case 310:
                [v23 setActionFeedbackTotalConfirmsTodayInLockscreen:v20];
                break;
              case 311:
                [v23 setActionFeedbackTotalRejectsTodayInLockscreen:v20];
                break;
              case 312:
                [v23 setActionFeedbackTotalConfirmsInLockscreen:v20];
                break;
              case 313:
                [v23 setActionFeedbackTotalRejectsInLockscreen:v20];
                break;
              case 314:
                [v23 setActionFeedbackMeanNumberOfSpotlightLaunchesPerDay:v20];
                break;
              case 315:
                [v23 setActionFeedbackMeanNumberOfSpotlightConfirmsPerDay:v20];
                break;
              case 316:
                [v23 setActionLaunchPopularity:v20];
                break;
              case 317:
                [v23 setActionTimeOfDayPopularity:v20];
                break;
              case 318:
                [v23 setActionTimeOfDayWithThirtyMinuteWindowPopularity:v20];
                break;
              case 319:
                [v23 setActionTimeOfDayWithHourWindowPopularity:v20];
                break;
              case 320:
                [v23 setActionTimeOfDayWithEightHourWindowPopularity:v20];
                break;
              case 321:
                [v23 setActionCoarseTimeOfDayPopularity:v20];
                break;
              case 322:
                [v23 setActionDayOfWeekPopularity:v20];
                break;
              case 323:
                [v23 setActionPartOfWeekPopularity:v20];
                break;
              case 324:
                [v23 setActionPartOfWeekAndLocationPopularity:v20];
                break;
              case 325:
                [v23 setActionLocationPopularity:v20];
                break;
              case 326:
                [v23 setActionCoreMotionPopularity:v20];
                break;
              case 327:
                [v23 setActionPreviousLocationPopularity:v20];
                break;
              case 328:
                [v23 setActionPreviousLocationAndCoreMotionPopularity:v20];
                break;
              case 329:
                [v23 setActionPreviousLocationAndLocationPopularity:v20];
                break;
              case 330:
                [v23 setActionTimeAndPreviousLocationPopularity:v20];
                break;
              case 331:
                [v23 setActionDayAndPreviousLocationPopularity:v20];
                break;
              case 332:
                [v23 setActionTimeAndDayPopularity:v20];
                break;
              case 333:
                [v23 setActionTimeAndLocationPopularity:v20];
                break;
              case 334:
                [v23 setActionDayAndLocationPopularity:v20];
                break;
              case 335:
                [v23 setActionTimeAndDayAndLocationPopularity:v20];
                break;
              case 336:
                [v23 setActionPartOfWeekAndTimePopularity:v20];
                break;
              case 337:
                [v23 setTotalLaunchesForAllActionsUsingTimeDecay:v20];
                break;
              case 338:
                [v23 setTotalLaunchesForAllActionsUsingDayOfWeekDecay:v20];
                break;
              case 339:
                [v23 setTotalLaunchesForAllActionsUsingLocationDecay:v20];
                break;
              case 340:
                [v23 setTotalLaunchesForAllActionsUsingCoreMotionDecay:v20];
                break;
              case 341:
                [v23 setTotalLaunchesForAllActionsUsingPreviousLocationDecay:v20];
                break;
              case 342:
                [v23 setTotalLaunchesForAllActionsUsingPartOfWeekDecay:v20];
                break;
              case 343:
                [v23 setTotalLaunchesForAllActionsUsingPreviousLocationAndCoreMotionDecay:v20];
                break;
              case 344:
                [v23 setTotalLaunchesForAllActionsUsingPreviousLocationAndLocationDecay:v20];
                break;
              case 345:
                [v23 setTotalLaunchesForAllActionsUsingTimeAndPreviousLocationDecay:v20];
                break;
              case 346:
                [v23 setTotalLaunchesForAllActionsUsingDayAndPreviousLocationDecay:v20];
                break;
              case 347:
                [v23 setTotalLaunchesForAllActionsUsingTimeAndDayDecay:v20];
                break;
              case 348:
                [v23 setTotalLaunchesForAllActionsUsingTimeAndLocationDecay:v20];
                break;
              case 349:
                [v23 setTotalLaunchesForAllActionsUsingDayAndLocationDecay:v20];
                break;
              case 350:
                [v23 setTotalLaunchesForAllActionsUsingTimeAndDayAndLocationDecay:v20];
                break;
              case 351:
                [v23 setTotalLaunchesForAllActionsUsingPartOfWeekAndLocationDecay:v20];
                break;
              case 352:
                [v23 setTotalLaunchesForAllActionsUsingPartOfWeekAndTimeDecay:v20];
                break;
              case 353:
                [v23 setRandomSessionValue:v20];
                break;
              case 354:
                [v23 setRandomScore:v20];
                break;
              case 355:
                [v23 setActionTotalConfirms:v20];
                break;
              case 356:
                [v23 setActionTotalRejects:v20];
                break;
              case 357:
                [v23 setActionTotalExplicitRejectsNoDecay:v20];
                break;
              case 360:
                [v23 setAppGlobalScoreGivenTimeDayLocationAndLastApp:v20];
                break;
              case 361:
                [v23 setAppGlobalScoreGivenTimeDayAndLocation:v20];
                break;
              case 362:
                [v23 setAppLOITypeLaunches:v20];
                break;
              case 363:
                [v23 setAppLastAppLaunches:v20];
                break;
              case 364:
                [v23 setAppTimeOfDayLaunches:v20];
                break;
              case 365:
                [v23 setAppDayOfWeekLaunches:v20];
                break;
              case 366:
                [v23 setAppBlendedLOITypePopularity:v20];
                break;
              case 367:
                [v23 setAppBlendedLastAppPopularity:v20];
                break;
              case 368:
                [v23 setAppBlendedTimeOfDayPopularity:v20];
                break;
              case 369:
                [v23 setAppBlendedDayOfWeekPopularity:v20];
                break;
              case 370:
                [v23 setAppBlendedLOITypeSampledPopularity:v20];
                break;
              case 371:
                [v23 setAppBlendedLastAppSampledPopularity:v20];
                break;
              case 372:
                [v23 setAppBlendedTimeOfDaySampledPopularity:v20];
                break;
              case 373:
                [v23 setAppBlendedDayOfWeekSampledPopularity:v20];
                break;
              case 374:
                [v23 setActionIsFutureMedia:v20];
                break;
              case 375:
                [v23 setActionIsBackgroundExecutable:v20];
                break;
              case 376:
                [v23 setActionCoreMotionType:v20];
                break;
              case 377:
                [v23 setActionLOIType:v20];
                break;
              case 378:
                [v23 setSlotIsSiriKitIntent:v20];
                break;
              case 379:
                [v23 setSlotIsCustomIntent:v20];
                break;
              case 380:
                [v23 setSlotIsNSUserActivity:v20];
                break;
              case 381:
                [v23 setAppActionScore:v20];
                break;
              case 382:
                [v23 setAppActionLogProbability:v20];
                break;
              case 383:
                [v23 setSlotScore:v20];
                break;
              case 384:
                [v23 setSlotLogProbability:v20];
                break;
              case 385:
                [v23 setActionHeuristicConfirmEvents:v20];
                break;
              case 386:
                [v23 setActionHeuristicRejectEvents:v20];
                break;
              case 387:
                [v23 setTotalActionHeuristicConfirmEvents:v20];
                break;
              case 388:
                [v23 setTotalActionHeuristicRejectEvents:v20];
                break;
              case 389:
                [v23 setAmbientLightTypePopularity:v20];
                break;
              case 390:
                [v23 setAmbientLightTypeLaunchPopularity:v20];
                break;
              case 391:
                [v23 setAppIntentAmbientLightTypePopularity:v20];
                break;
              case 392:
                [v23 setAppIntentAmbientLightTypeLaunchPopularity:v20];
                break;
              case 393:
                [v23 setAppLaunchesCoarseTimePowLocationForAppInContext:v20];
                break;
              case 394:
                [v23 setAppLaunchesCoarseTimePowLocationInContext:v20];
                break;
              case 395:
                [v23 setAppLaunchesCoarseTimePowLocationForApp:v20];
                break;
              case 396:
                [v23 setAppLaunchesCoarseTimePowLocationForAllAppsAndContexts:v20];
                break;
              case 397:
                [v23 setAppConfirmsCoarseTimePowLocationForAppInContext:v20];
                break;
              case 398:
                [v23 setAppConfirmsCoarseTimePowLocationInContext:v20];
                break;
              case 399:
                [v23 setAppConfirmsCoarseTimePowLocationForApp:v20];
                break;
              case 400:
                [v23 setAppConfirmsCoarseTimePowLocationForAllAppsAndContexts:v20];
                break;
              case 401:
                [v23 setAppRejectsCoarseTimePowLocationForAppInContext:v20];
                break;
              case 402:
                [v23 setAppRejectsCoarseTimePowLocationInContext:v20];
                break;
              case 403:
                [v23 setAppRejectsCoarseTimePowLocationForApp:v20];
                break;
              case 404:
                [v23 setAppRejectsCoarseTimePowLocationForAllAppsAndContexts:v20];
                break;
              case 405:
                [v23 setAppExplicitRejectsCoarseTimePowLocationForAppInContext:v20];
                break;
              case 406:
                [v23 setAppExplicitRejectsCoarseTimePowLocationInContext:v20];
                break;
              case 407:
                [v23 setAppExplicitRejectsCoarseTimePowLocationForApp:v20];
                break;
              case 408:
                [v23 setAppExplicitRejectsCoarseTimePowLocationForAllAppsAndContexts:v20];
                break;
              case 409:
                [v23 setAppLaunchesSpecificTimeDowLocationForAppInContext:v20];
                break;
              case 410:
                [v23 setAppLaunchesSpecificTimeDowLocationInContext:v20];
                break;
              case 411:
                [v23 setAppLaunchesSpecificTimeDowLocationForApp:v20];
                break;
              case 412:
                [v23 setAppLaunchesSpecificTimeDowLocationForAllAppsAndContexts:v20];
                break;
              case 413:
                [v23 setAppConfirmsSpecificTimeDowLocationForAppInContext:v20];
                break;
              case 414:
                [v23 setAppConfirmsSpecificTimeDowLocationInContext:v20];
                break;
              case 415:
                [v23 setAppConfirmsSpecificTimeDowLocationForApp:v20];
                break;
              case 416:
                [v23 setAppConfirmsSpecificTimeDowLocationForAllAppsAndContexts:v20];
                break;
              case 417:
                [v23 setAppRejectsSpecificTimeDowLocationForAppInContext:v20];
                break;
              case 418:
                [v23 setAppRejectsSpecificTimeDowLocationInContext:v20];
                break;
              case 419:
                [v23 setAppRejectsSpecificTimeDowLocationForApp:v20];
                break;
              case 420:
                [v23 setAppRejectsSpecificTimeDowLocationForAllAppsAndContexts:v20];
                break;
              case 421:
                [v23 setActionsCoarseTimePowLocationForActionInContext:v20];
                break;
              case 422:
                [v23 setActionsCoarseTimePowLocationInContext:v20];
                break;
              case 423:
                [v23 setActionsCoarseTimePowLocationForAction:v20];
                break;
              case 424:
                [v23 setActionsCoarseTimePowLocationForAllActionsAndContexts:v20];
                break;
              case 425:
                [v23 setActionConfirmsCoarseTimePowLocationForActionInContext:v20];
                break;
              case 426:
                [v23 setActionConfirmsCoarseTimePowLocationInContext:v20];
                break;
              case 427:
                [v23 setActionConfirmsCoarseTimePowLocationForAction:v20];
                break;
              case 428:
                [v23 setActionConfirmsCoarseTimePowLocationForAllActionsAndContexts:v20];
                break;
              case 429:
                [v23 setActionRejectsCoarseTimePowLocationForActionInContext:v20];
                break;
              case 430:
                [v23 setActionRejectsCoarseTimePowLocationInContext:v20];
                break;
              case 431:
                [v23 setActionRejectsCoarseTimePowLocationForAction:v20];
                break;
              case 432:
                [v23 setActionRejectsCoarseTimePowLocationForAllActionsAndContexts:v20];
                break;
              case 433:
                [v23 setActionsSpecificTimeDowLocationForActionInContext:v20];
                break;
              case 434:
                [v23 setActionsSpecificTimeDowLocationInContext:v20];
                break;
              case 435:
                [v23 setActionsSpecificTimeDowLocationForAction:v20];
                break;
              case 436:
                [v23 setActionsSpecificTimeDowLocationForAllActionsAndContexts:v20];
                break;
              case 437:
                [v23 setActionConfirmsSpecificTimeDowLocationForActionInContext:v20];
                break;
              case 438:
                [v23 setActionConfirmsSpecificTimeDowLocationInContext:v20];
                break;
              case 439:
                [v23 setActionConfirmsSpecificTimeDowLocationForAction:v20];
                break;
              case 440:
                [v23 setActionConfirmsSpecificTimeDowLocationForAllActionsAndContexts:v20];
                break;
              case 441:
                [v23 setActionRejectsSpecificTimeDowLocationForActionInContext:v20];
                break;
              case 442:
                [v23 setActionRejectsSpecificTimeDowLocationInContext:v20];
                break;
              case 443:
                [v23 setActionRejectsSpecificTimeDowLocationForAction:v20];
                break;
              case 444:
                [v23 setActionRejectsSpecificTimeDowLocationForAllActionsAndContexts:v20];
                break;
              case 445:
                [v23 setAppLaunchesInTimeBucket0ForApp:v20];
                break;
              case 446:
                [v23 setAppLaunchesInTimeBucket1ForApp:v20];
                break;
              case 447:
                [v23 setAppLaunchesInTimeBucket2ForApp:v20];
                break;
              case 448:
                [v23 setAppLaunchesInTimeBucket3ForApp:v20];
                break;
              case 449:
                [v23 setAppLaunchesInTimeBucket4ForApp:v20];
                break;
              case 450:
                [v23 setAppLaunchesInTimeBucket5ForApp:v20];
                break;
              case 451:
                [v23 setAppLaunchesInTimeBucket6ForApp:v20];
                break;
              case 452:
                [v23 setAppLaunchesInTimeBucket7ForApp:v20];
                break;
              case 453:
                [v23 setAppLaunchesInTimeBucket8ForApp:v20];
                break;
              case 454:
                [v23 setAppLaunchesInTimeBucket9ForApp:v20];
                break;
              case 455:
                [v23 setAppLaunchesInTimeBucket10ForApp:v20];
                break;
              case 456:
                [v23 setAppLaunchesInTimeBucket11ForApp:v20];
                break;
              case 457:
                [v23 setAppLaunchesInTimeBucket12ForApp:v20];
                break;
              case 458:
                [v23 setAppLaunchesInTimeBucket13ForApp:v20];
                break;
              case 459:
                [v23 setAppLaunchesInTimeBucket14ForApp:v20];
                break;
              case 460:
                [v23 setAppLaunchesInTimeBucket15ForApp:v20];
                break;
              case 461:
                [v23 setAppLaunchesInTimeBucket16ForApp:v20];
                break;
              case 462:
                [v23 setAppLaunchesInTimeBucket17ForApp:v20];
                break;
              case 463:
                [v23 setAppLaunchesInTimeBucket18ForApp:v20];
                break;
              case 464:
                [v23 setAppLaunchesInTimeBucket19ForApp:v20];
                break;
              case 465:
                [v23 setAppLaunchesInTimeBucket20ForApp:v20];
                break;
              case 466:
                [v23 setAppLaunchesInTimeBucket21ForApp:v20];
                break;
              case 467:
                [v23 setAppLaunchesInTimeBucket22ForApp:v20];
                break;
              case 468:
                [v23 setAppLaunchesInTimeBucket23ForApp:v20];
                break;
              case 469:
                [v23 setAppLaunchesInTimeBucket24ForApp:v20];
                break;
              case 470:
                [v23 setAppLaunchesOnDayOfWeekSundayForApp:v20];
                break;
              case 471:
                [v23 setAppLaunchesOnDayOfWeekMondayForApp:v20];
                break;
              case 472:
                [v23 setAppLaunchesOnDayOfWeekTuesdayForApp:v20];
                break;
              case 473:
                [v23 setAppLaunchesOnDayOfWeekWednesdayForApp:v20];
                break;
              case 474:
                [v23 setAppLaunchesOnDayOfWeekThursdayForApp:v20];
                break;
              case 475:
                [v23 setAppLaunchesOnDayOfWeekFridayForApp:v20];
                break;
              case 476:
                [v23 setAppLaunchesOnDayOfWeekSaturdayForApp:v20];
                break;
              case 477:
                [v23 setAppLaunchesAtCoarseGeoHash0ForApp:v20];
                break;
              case 478:
                [v23 setAppLaunchesAtCoarseGeoHash1ForApp:v20];
                break;
              case 479:
                [v23 setAppLaunchesAtCoarseGeoHash2ForApp:v20];
                break;
              case 480:
                [v23 setAppLaunchesAtCoarseGeoHash3ForApp:v20];
                break;
              case 481:
                [v23 setAppLaunchesAtCoarseGeoHash4ForApp:v20];
                break;
              case 482:
                [v23 setAppLaunchesAtCoarseGeoHash5ForApp:v20];
                break;
              case 483:
                [v23 setAppLaunchesAtCoarseGeoHash6ForApp:v20];
                break;
              case 484:
                [v23 setAppLaunchesAtCoarseGeoHash7ForApp:v20];
                break;
              case 485:
                [v23 setAppLaunchesAtCoarseGeoHash8ForApp:v20];
                break;
              case 486:
                [v23 setAppLaunchesAtCoarseGeoHash9ForApp:v20];
                break;
              case 487:
                [v23 setAppLaunchesAtSpecificGeoHash0ForApp:v20];
                break;
              case 488:
                [v23 setAppLaunchesAtSpecificGeoHash1ForApp:v20];
                break;
              case 489:
                [v23 setAppLaunchesAtSpecificGeoHash2ForApp:v20];
                break;
              case 490:
                [v23 setAppLaunchesAtSpecificGeoHash3ForApp:v20];
                break;
              case 491:
                [v23 setAppLaunchesAtSpecificGeoHash4ForApp:v20];
                break;
              case 492:
                [v23 setAppLaunchesAtSpecificGeoHash5ForApp:v20];
                break;
              case 493:
                [v23 setAppLaunchesAtSpecificGeoHash6ForApp:v20];
                break;
              case 494:
                [v23 setAppLaunchesAtSpecificGeoHash7ForApp:v20];
                break;
              case 495:
                [v23 setAppLaunchesAtSpecificGeoHash8ForApp:v20];
                break;
              case 496:
                [v23 setAppLaunchesAtSpecificGeoHash9ForApp:v20];
                break;
              case 497:
                [v23 setAppLaunchesAtSpecificGeoHash10ForApp:v20];
                break;
              case 498:
                [v23 setAppLaunchesAtSpecificGeoHash11ForApp:v20];
                break;
              case 499:
                [v23 setAppLaunchesAtSpecificGeoHash12ForApp:v20];
                break;
              case 500:
                [v23 setAppLaunchesAtSpecificGeoHash13ForApp:v20];
                break;
              case 501:
                [v23 setAppLaunchesAtSpecificGeoHash14ForApp:v20];
                break;
              case 502:
                [v23 setAppNumberOfSpecificGeohashesForApp:v20];
                break;
              case 503:
                [v23 setAppNumberOfCoarseGeohashesForApp:v20];
                break;
              case 504:
                [v23 setAppEntropyForTimeBuckets:v20];
                break;
              case 505:
                [v23 setAppEntropyForSpecificGeoHash:v20];
                break;
              case 506:
                [v23 setAppEntropyForCoarseGeoHash:v20];
                break;
              case 507:
                [v23 setAppLaunchesAtSpecificGeoHashForAppInContext:v20];
                break;
              case 508:
                [v23 setAppLaunchesAtCoarseGeoHashForAppInContext:v20];
                break;
              case 509:
                [v23 setAppLaunchesAtDayOfWeekInContext:v20];
                break;
              case 510:
                [v23 setAppLaunchesAtDayOfWeekForApp:v20];
                break;
              case 511:
                [v23 setAppLaunchesAtTimeAndDayForAppInContext:v20];
                break;
              case 512:
                [v23 setAppLaunchesAtTimeAndDayInContext:v20];
                break;
              case 513:
                [v23 setAppLaunchesAtTimeAndDayForApp:v20];
                break;
              case 514:
                [v23 setAppLaunchesAtCoarseGeoHashInContext:v20];
                break;
              case 515:
                [v23 setAppLaunchesAtCoarseGeoHashForApp:v20];
                break;
              case 516:
                [v23 setAppLaunchesAtSpecificGeoHashInContext:v20];
                break;
              case 517:
                [v23 setAppLaunchesAtSpecificGeoHashForApp:v20];
                break;
              case 518:
                [v23 setAppLaunchesForAllAppsAndContextsDecayedAtCoarseContextRate:v20];
                break;
              case 519:
                [v23 setAppLaunchesForAllAppsAndContextsDecayedAtSpecificContextRate:v20];
                break;
              case 520:
                [v23 setIsLocationServicesDisabled:v20];
                break;
              case 521:
                [v23 setAppLaunchesInTwoHourTimeBucketForAppInContext:v20];
                break;
              case 522:
                [v23 setAppLaunchesInTwoHourTimeBucketInContext:v20];
                break;
              case 523:
                [v23 setAppLaunchesInTwoHourTimeBucketForApp:v20];
                break;
              case 524:
                [v23 setAppConfirmsInTwoHourTimeBucketForAppInContext:v20];
                break;
              case 525:
                [v23 setAppConfirmsInTwoHourTimeBucketInContext:v20];
                break;
              case 526:
                [v23 setAppConfirmsInTwoHourTimeBucketForApp:v20];
                break;
              case 527:
                [v23 setAppRejectsInTwoHourTimeBucketForAppInContext:v20];
                break;
              case 528:
                [v23 setAppRejectsInTwoHourTimeBucketInContext:v20];
                break;
              case 529:
                [v23 setAppRejectsInTwoHourTimeBucketForApp:v20];
                break;
              case 530:
                [v23 setAppConfirmsAtDayOfWeekForAppInContext:v20];
                break;
              case 531:
                [v23 setAppConfirmsAtDayOfWeekInContext:v20];
                break;
              case 532:
                [v23 setAppConfirmsAtDayOfWeekForApp:v20];
                break;
              case 533:
                [v23 setAppRejectsAtDayOfWeekForAppInContext:v20];
                break;
              case 534:
                [v23 setAppRejectsAtDayOfWeekInContext:v20];
                break;
              case 535:
                [v23 setAppRejectsAtDayOfWeekForApp:v20];
                break;
              case 536:
                [v23 setAppConfirmsAtCoarseGeoHashForAppInContext:v20];
                break;
              case 537:
                [v23 setAppConfirmsAtCoarseGeoHashInContext:v20];
                break;
              case 538:
                [v23 setAppConfirmsAtCoarseGeoHashForApp:v20];
                break;
              case 539:
                [v23 setAppRejectsAtCoarseGeoHashForAppInContext:v20];
                break;
              case 540:
                [v23 setAppRejectsAtCoarseGeoHashInContext:v20];
                break;
              case 541:
                [v23 setAppRejectsAtCoarseGeoHashForApp:v20];
                break;
              case 542:
                [v23 setAppConfirmsAtSpecificGeoHashForAppInContext:v20];
                break;
              case 543:
                [v23 setAppConfirmsAtSpecificGeoHashInContext:v20];
                break;
              case 544:
                [v23 setAppConfirmsAtSpecificGeoHashForApp:v20];
                break;
              case 545:
                [v23 setAppRejectsAtSpecificGeoHashForAppInContext:v20];
                break;
              case 546:
                [v23 setAppRejectsAtSpecificGeoHashInContext:v20];
                break;
              case 547:
                [v23 setAppRejectsAtSpecificGeoHashForApp:v20];
                break;
              case 548:
                [v23 setAppConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate:v20];
                break;
              case 549:
                [v23 setAppConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate:v20];
                break;
              case 550:
                [v23 setAppRejectsForAllAppsAndContextsDecayedAtCoarseContextRate:v20];
                break;
              case 551:
                [v23 setAppRejectsForAllAppsAndContextsDecayedAtSpecificContextRate:v20];
                break;
              case 552:
                [v23 setCurrentTimeBucketFromZeroToTwentyFour:v20];
                break;
              case 553:
                [v23 setActionsAtDayOfWeekForActionInContext:v20];
                break;
              case 554:
                [v23 setActionsAtDayOfWeekInContext:v20];
                break;
              case 555:
                [v23 setActionsAtDayOfWeekForAction:v20];
                break;
              case 556:
                [v23 setActionsAtCoarseGeoHashForActionInContext:v20];
                break;
              case 557:
                [v23 setActionsAtCoarseGeoHashInContext:v20];
                break;
              case 558:
                [v23 setActionsAtCoarseGeoHashForAction:v20];
                break;
              case 559:
                [v23 setActionsAtSpecificGeoHashForActionInContext:v20];
                break;
              case 560:
                [v23 setActionsAtSpecificGeoHashInContext:v20];
                break;
              case 561:
                [v23 setActionsAtSpecificGeoHashForAction:v20];
                break;
              case 562:
                [v23 setActionsAtTimeOfDayForActionInContext:v20];
                break;
              case 563:
                [v23 setActionsAtTimeOfDayInContext:v20];
                break;
              case 564:
                [v23 setActionsAtTimeOfDayForAction:v20];
                break;
              case 565:
                [v23 setActionConfirmsAtTimeOfDayForActionInContext:v20];
                break;
              case 566:
                [v23 setActionConfirmsAtTimeOfDayInContext:v20];
                break;
              case 567:
                [v23 setActionConfirmsAtTimeOfDayForAction:v20];
                break;
              case 568:
                [v23 setActionRejectsAtTimeOfDayForActionInContext:v20];
                break;
              case 569:
                [v23 setActionRejectsAtTimeOfDayInContext:v20];
                break;
              case 570:
                [v23 setActionRejectsAtTimeOfDayForAction:v20];
                break;
              case 571:
                [v23 setActionConfirmsAtDayOfWeekForActionInContext:v20];
                break;
              case 572:
                [v23 setActionConfirmsAtDayOfWeekInContext:v20];
                break;
              case 573:
                [v23 setActionConfirmsAtDayOfWeekForAction:v20];
                break;
              case 574:
                [v23 setActionRejectsAtDayOfWeekForActionInContext:v20];
                break;
              case 575:
                [v23 setActionRejectsAtDayOfWeekInContext:v20];
                break;
              case 576:
                [v23 setActionRejectsAtDayOfWeekForAction:v20];
                break;
              case 577:
                [v23 setActionConfirmsAtCoarseGeoHashForActionInContext:v20];
                break;
              case 578:
                [v23 setActionConfirmsAtCoarseGeoHashInContext:v20];
                break;
              case 579:
                [v23 setActionConfirmsAtCoarseGeoHashForAction:v20];
                break;
              case 580:
                [v23 setActionRejectsAtCoarseGeoHashForActionInContext:v20];
                break;
              case 581:
                [v23 setActionRejectsAtCoarseGeoHashInContext:v20];
                break;
              case 582:
                [v23 setActionRejectsAtCoarseGeoHashForAction:v20];
                break;
              case 583:
                [v23 setActionConfirmsAtSpecificGeoHashForActionInContext:v20];
                break;
              case 584:
                [v23 setActionConfirmsAtSpecificGeoHashInContext:v20];
                break;
              case 585:
                [v23 setActionConfirmsAtSpecificGeoHashForAction:v20];
                break;
              case 586:
                [v23 setActionRejectsAtSpecificGeoHashForActionInContext:v20];
                break;
              case 587:
                [v23 setActionRejectsAtSpecificGeoHashInContext:v20];
                break;
              case 588:
                [v23 setActionRejectsAtSpecificGeoHashForAction:v20];
                break;
              case 589:
                [v23 setActionsInTimeBucket0ForAction:v20];
                break;
              case 590:
                [v23 setActionsInTimeBucket1ForAction:v20];
                break;
              case 591:
                [v23 setActionsInTimeBucket2ForAction:v20];
                break;
              case 592:
                [v23 setActionsInTimeBucket3ForAction:v20];
                break;
              case 593:
                [v23 setActionsInTimeBucket4ForAction:v20];
                break;
              case 594:
                [v23 setActionsInTimeBucket5ForAction:v20];
                break;
              case 595:
                [v23 setActionsInTimeBucket6ForAction:v20];
                break;
              case 596:
                [v23 setActionsInTimeBucket7ForAction:v20];
                break;
              case 597:
                [v23 setActionsInTimeBucket8ForAction:v20];
                break;
              case 598:
                [v23 setActionsInTimeBucket9ForAction:v20];
                break;
              case 599:
                [v23 setActionsInTimeBucket10ForAction:v20];
                break;
              case 600:
                [v23 setActionsInTimeBucket11ForAction:v20];
                break;
              case 601:
                [v23 setActionsInTimeBucket12ForAction:v20];
                break;
              case 602:
                [v23 setActionsInTimeBucket13ForAction:v20];
                break;
              case 603:
                [v23 setActionsInTimeBucket14ForAction:v20];
                break;
              case 604:
                [v23 setActionsInTimeBucket15ForAction:v20];
                break;
              case 605:
                [v23 setActionsInTimeBucket16ForAction:v20];
                break;
              case 606:
                [v23 setActionsInTimeBucket17ForAction:v20];
                break;
              case 607:
                [v23 setActionsInTimeBucket18ForAction:v20];
                break;
              case 608:
                [v23 setActionsInTimeBucket19ForAction:v20];
                break;
              case 609:
                [v23 setActionsInTimeBucket20ForAction:v20];
                break;
              case 610:
                [v23 setActionsInTimeBucket21ForAction:v20];
                break;
              case 611:
                [v23 setActionsInTimeBucket22ForAction:v20];
                break;
              case 612:
                [v23 setActionsInTimeBucket23ForAction:v20];
                break;
              case 613:
                [v23 setActionsInTimeBucket24ForAction:v20];
                break;
              case 614:
                [v23 setActionsOnDayOfWeekSundayForAction:v20];
                break;
              case 615:
                [v23 setActionsOnDayOfWeekMondayForAction:v20];
                break;
              case 616:
                [v23 setActionsOnDayOfWeekTuesdayForAction:v20];
                break;
              case 617:
                [v23 setActionsOnDayOfWeekWednesdayForAction:v20];
                break;
              case 618:
                [v23 setActionsOnDayOfWeekThursdayForAction:v20];
                break;
              case 619:
                [v23 setActionsOnDayOfWeekFridayForAction:v20];
                break;
              case 620:
                [v23 setActionsOnDayOfWeekSaturdayForAction:v20];
                break;
              case 621:
                [v23 setActionsAtCoarseGeoHash0ForAction:v20];
                break;
              case 622:
                [v23 setActionsAtCoarseGeoHash1ForAction:v20];
                break;
              case 623:
                [v23 setActionsAtCoarseGeoHash2ForAction:v20];
                break;
              case 624:
                [v23 setActionsAtCoarseGeoHash3ForAction:v20];
                break;
              case 625:
                [v23 setActionsAtCoarseGeoHash4ForAction:v20];
                break;
              case 626:
                [v23 setActionsAtCoarseGeoHash5ForAction:v20];
                break;
              case 627:
                [v23 setActionsAtCoarseGeoHash6ForAction:v20];
                break;
              case 628:
                [v23 setActionsAtCoarseGeoHash7ForAction:v20];
                break;
              case 629:
                [v23 setActionsAtCoarseGeoHash8ForAction:v20];
                break;
              case 630:
                [v23 setActionsAtCoarseGeoHash9ForAction:v20];
                break;
              case 631:
                [v23 setActionsAtSpecificGeoHash0ForAction:v20];
                break;
              case 632:
                [v23 setActionsAtSpecificGeoHash1ForAction:v20];
                break;
              case 633:
                [v23 setActionsAtSpecificGeoHash2ForAction:v20];
                break;
              case 634:
                [v23 setActionsAtSpecificGeoHash3ForAction:v20];
                break;
              case 635:
                [v23 setActionsAtSpecificGeoHash4ForAction:v20];
                break;
              case 636:
                [v23 setActionsAtSpecificGeoHash5ForAction:v20];
                break;
              case 637:
                [v23 setActionsAtSpecificGeoHash6ForAction:v20];
                break;
              case 638:
                [v23 setActionsAtSpecificGeoHash7ForAction:v20];
                break;
              case 639:
                [v23 setActionsAtSpecificGeoHash8ForAction:v20];
                break;
              case 640:
                [v23 setActionsAtSpecificGeoHash9ForAction:v20];
                break;
              case 641:
                [v23 setActionsAtSpecificGeoHash10ForAction:v20];
                break;
              case 642:
                [v23 setActionsAtSpecificGeoHash11ForAction:v20];
                break;
              case 643:
                [v23 setActionsAtSpecificGeoHash12ForAction:v20];
                break;
              case 644:
                [v23 setActionsAtSpecificGeoHash13ForAction:v20];
                break;
              case 645:
                [v23 setActionsAtSpecificGeoHash14ForAction:v20];
                break;
              case 646:
                [v23 setActionEntropyForTimeOfDay:v20];
                break;
              case 647:
                [v23 setActionEntropyForDayOfWeek:v20];
                break;
              case 648:
                [v23 setActionEntropyForCoarseGeoHash:v20];
                break;
              case 649:
                [v23 setActionEntropyForSpecificGeoHash:v20];
                break;
              case 650:
                [v23 setActionNumberOfSpecificGeohashesForAction:v20];
                break;
              case 651:
                [v23 setActionNumberOfCoarseGeohashesForAction:v20];
                break;
              case 652:
                [v23 setAppLaunchesAtZoom7GeoHashForAppInContext:v20];
                break;
              case 653:
                [v23 setAppLaunchesAtZoom7GeoHashInContext:v20];
                break;
              case 654:
                [v23 setAppLaunchesAtZoom7GeoHashForApp:v20];
                break;
              case 655:
                [v23 setAppLaunchesAtZoom7GeoHash0ForApp:v20];
                break;
              case 656:
                [v23 setAppLaunchesAtZoom7GeoHash1ForApp:v20];
                break;
              case 657:
                [v23 setAppLaunchesAtZoom7GeoHash2ForApp:v20];
                break;
              case 658:
                [v23 setAppLaunchesAtZoom7GeoHash3ForApp:v20];
                break;
              case 659:
                [v23 setAppLaunchesAtZoom7GeoHash4ForApp:v20];
                break;
              case 660:
                [v23 setAppLaunchesAtZoom7GeoHash5ForApp:v20];
                break;
              case 661:
                [v23 setAppLaunchesAtZoom7GeoHash6ForApp:v20];
                break;
              case 662:
                [v23 setAppLaunchesAtZoom7GeoHash7ForApp:v20];
                break;
              case 663:
                [v23 setAppLaunchesAtZoom7GeoHash8ForApp:v20];
                break;
              case 664:
                [v23 setAppLaunchesAtZoom7GeoHash9ForApp:v20];
                break;
              case 665:
                [v23 setAppEntropyForZoom7GeoHash:v20];
                break;
              case 666:
                [v23 setAppNumberOfZoom7GeohashesForApp:v20];
                break;
              case 667:
                [v23 setAppGeoAssociationScoreAtZoom7:v20];
                break;
              case 668:
                [v23 setAppGeoAssociationScoreAtZoom13:v20];
                break;
              case 669:
                [v23 setAppGeoAssociationScoreAtZoom16:v20];
                break;
              case 670:
                [v23 setAppPartOfWeekAssociationScore:v20];
                break;
              case 671:
                [v23 setAppCoarseTimeAssociationScore:v20];
                break;
              case 672:
                [v23 setAppLOITypeAssociationScore:v20];
                break;
              case 673:
                [v23 setAppLaunchesAtSSIDForAppInContext:v20];
                break;
              case 674:
                [v23 setAppLaunchesAtSSIDForApp:v20];
                break;
              case 675:
                [v23 setAppLaunchesForCoreMotionForAppInContext:v20];
                break;
              case 676:
                [v23 setAppLaunchesInAirplaneModeForAppInContext:v20];
                break;
              case 677:
                [v23 setHomeScreenAppConfirmsOnDayOfWeekForAppInContext:v20];
                break;
              case 678:
                [v23 setHomeScreenAppConfirmsOnDayOfWeekInContext:v20];
                break;
              case 679:
                [v23 setHomeScreenAppConfirmsOnDayOfWeekForApp:v20];
                break;
              case 680:
                [v23 setHomeScreenAppRejectsOnDayOfWeekForAppInContext:v20];
                break;
              case 681:
                [v23 setHomeScreenAppRejectsOnDayOfWeekInContext:v20];
                break;
              case 682:
                [v23 setHomeScreenAppRejectsOnDayOfWeekForApp:v20];
                break;
              case 683:
                [v23 setHomeScreenAppConfirmsInTwoHourTimeIntervalForAppInContext:v20];
                break;
              case 684:
                [v23 setHomeScreenAppConfirmsInTwoHourTimeIntervalInContext:v20];
                break;
              case 685:
                [v23 setHomeScreenAppConfirmsInTwoHourTimeIntervalForApp:v20];
                break;
              case 686:
                [v23 setHomeScreenAppRejectsInTwoHourTimeIntervalForAppInContext:v20];
                break;
              case 687:
                [v23 setHomeScreenAppRejectsInTwoHourTimeIntervalInContext:v20];
                break;
              case 688:
                [v23 setHomeScreenAppRejectsInTwoHourTimeIntervalForApp:v20];
                break;
              case 689:
                [v23 setHomeScreenAppConfirmsAtCoarseGeohashForAppInContext:v20];
                break;
              case 690:
                [v23 setHomeScreenAppConfirmsAtCoarseGeohashInContext:v20];
                break;
              case 691:
                [v23 setHomeScreenAppConfirmsAtCoarseGeohashForApp:v20];
                break;
              case 692:
                [v23 setHomeScreenAppRejectsAtCoarseGeohashForAppInContext:v20];
                break;
              case 693:
                [v23 setHomeScreenAppRejectsAtCoarseGeohashInContext:v20];
                break;
              case 694:
                [v23 setHomeScreenAppRejectsAtCoarseGeohashForApp:v20];
                break;
              case 695:
                [v23 setHomeScreenAppConfirmsAtSpecificGeohashForAppInContext:v20];
                break;
              case 696:
                [v23 setHomeScreenAppConfirmsAtSpecificGeohashInContext:v20];
                break;
              case 697:
                [v23 setHomeScreenAppConfirmsAtSpecificGeohashForApp:v20];
                break;
              case 698:
                [v23 setHomeScreenAppRejectsAtSpecificGeohashForAppInContext:v20];
                break;
              case 699:
                [v23 setHomeScreenAppRejectsAtSpecificGeohashInContext:v20];
                break;
              case 700:
                [v23 setHomeScreenAppRejectsAtSpecificGeohashForApp:v20];
                break;
              case 701:
                [v23 setHomeScreenAppConfirmsAtCoarseTimePOWLocationForAppInContext:v20];
                break;
              case 702:
                [v23 setHomeScreenAppConfirmsAtCoarseTimePOWLocationInContext:v20];
                break;
              case 703:
                [v23 setHomeScreenAppConfirmsAtCoarseTimePOWLocationForApp:v20];
                break;
              case 704:
                [v23 setHomeScreenAppRejectsAtCoarseTimePOWLocationForAppInContext:v20];
                break;
              case 705:
                [v23 setHomeScreenAppRejectsAtCoarseTimePOWLocationInContext:v20];
                break;
              case 706:
                [v23 setHomeScreenAppRejectsAtCoarseTimePOWLocationForApp:v20];
                break;
              case 707:
                [v23 setHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationForAppInContext:v20];
                break;
              case 708:
                [v23 setHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationInContext:v20];
                break;
              case 709:
                [v23 setHomeScreenAppExplicitRejectsAtCoarseTimePOWLocationForApp:v20];
                break;
              case 710:
                [v23 setHomeScreenAppConfirmsAtSpecificTimeDOWLocationForAppInContext:v20];
                break;
              case 711:
                [v23 setHomeScreenAppConfirmsAtSpecificTimeDOWLocationInContext:v20];
                break;
              case 712:
                [v23 setHomeScreenAppConfirmsAtSpecificTimeDOWLocationForApp:v20];
                break;
              case 713:
                [v23 setHomeScreenAppRejectsAtSpecificTimeDOWLocationForAppInContext:v20];
                break;
              case 714:
                [v23 setHomeScreenAppRejectsAtSpecificTimeDOWLocationInContext:v20];
                break;
              case 715:
                [v23 setHomeScreenAppRejectsAtSpecificTimeDOWLocationForApp:v20];
                break;
              case 716:
                [v23 setHomeScreenTotalLaunchesForApp:v20];
                break;
              case 717:
                [v23 setHomeScreenTotalLaunchesForAllApps:v20];
                break;
              case 718:
                [v23 setAppDirectoryTotalLaunchesForApp:v20];
                break;
              case 719:
                [v23 setAppDirectoryTotalLaunchesForAllApps:v20];
                break;
              case 720:
                [v23 setAppDirectoryConfirmsOnDayOfWeekForAppInContext:v20];
                break;
              case 721:
                [v23 setAppDirectoryConfirmsOnDayOfWeekInContext:v20];
                break;
              case 722:
                [v23 setAppDirectoryConfirmsOnDayOfWeekForApp:v20];
                break;
              case 723:
                [v23 setAppDirectoryRejectsOnDayOfWeekForAppInContext:v20];
                break;
              case 724:
                [v23 setAppDirectoryRejectsOnDayOfWeekInContext:v20];
                break;
              case 725:
                [v23 setAppDirectoryRejectsOnDayOfWeekForApp:v20];
                break;
              case 726:
                [v23 setAppDirectoryConfirmsInTwoHourTimeIntervalForAppInContext:v20];
                break;
              case 727:
                [v23 setAppDirectoryConfirmsInTwoHourTimeIntervalInContext:v20];
                break;
              case 728:
                [v23 setAppDirectoryConfirmsInTwoHourTimeIntervalForApp:v20];
                break;
              case 729:
                [v23 setAppDirectoryRejectsInTwoHourTimeIntervalForAppInContext:v20];
                break;
              case 730:
                [v23 setAppDirectoryRejectsInTwoHourTimeIntervalInContext:v20];
                break;
              case 731:
                [v23 setAppDirectoryRejectsInTwoHourTimeIntervalForApp:v20];
                break;
              case 732:
                [v23 setAppDirectoryConfirmsAtCoarseGeohashForAppInContext:v20];
                break;
              case 733:
                [v23 setAppDirectoryConfirmsAtCoarseGeohashInContext:v20];
                break;
              case 734:
                [v23 setAppDirectoryConfirmsAtCoarseGeohashForApp:v20];
                break;
              case 735:
                [v23 setAppDirectoryRejectsAtCoarseGeohashForAppInContext:v20];
                break;
              case 736:
                [v23 setAppDirectoryRejectsAtCoarseGeohashInContext:v20];
                break;
              case 737:
                [v23 setAppDirectoryRejectsAtCoarseGeohashForApp:v20];
                break;
              case 738:
                [v23 setAppDirectoryConfirmsAtSpecificGeohashForAppInContext:v20];
                break;
              case 739:
                [v23 setAppDirectoryConfirmsAtSpecificGeohashInContext:v20];
                break;
              case 740:
                [v23 setAppDirectoryConfirmsAtSpecificGeohashForApp:v20];
                break;
              case 741:
                [v23 setAppDirectoryRejectsAtSpecificGeohashForAppInContext:v20];
                break;
              case 742:
                [v23 setAppDirectoryRejectsAtSpecificGeohashInContext:v20];
                break;
              case 743:
                [v23 setAppDirectoryRejectsAtSpecificGeohashForApp:v20];
                break;
              case 744:
                [v23 setAppDirectoryConfirmsAtCoarseTimePOWLocationForAppInContext:v20];
                break;
              case 745:
                [v23 setAppDirectoryConfirmsAtCoarseTimePOWLocationInContext:v20];
                break;
              case 746:
                [v23 setAppDirectoryConfirmsAtCoarseTimePOWLocationForApp:v20];
                break;
              case 747:
                [v23 setAppDirectoryRejectsAtCoarseTimePOWLocationForAppInContext:v20];
                break;
              case 748:
                [v23 setAppDirectoryRejectsAtCoarseTimePOWLocationInContext:v20];
                break;
              case 749:
                [v23 setAppDirectoryRejectsAtCoarseTimePOWLocationForApp:v20];
                break;
              case 750:
                [v23 setAppDirectoryExplicitRejectsAtCoarseTimePOWLocationForAppInContext:v20];
                break;
              case 751:
                [v23 setAppDirectoryExplicitRejectsAtCoarseTimePOWLocationInContext:v20];
                break;
              case 752:
                [v23 setAppDirectoryExplicitRejectsAtCoarseTimePOWLocationForApp:v20];
                break;
              case 753:
                [v23 setAppDirectoryConfirmsAtSpecificTimeDOWLocationForAppInContext:v20];
                break;
              case 754:
                [v23 setAppDirectoryConfirmsAtSpecificTimeDOWLocationInContext:v20];
                break;
              case 755:
                [v23 setAppDirectoryConfirmsAtSpecificTimeDOWLocationForApp:v20];
                break;
              case 756:
                [v23 setAppDirectoryRejectsAtSpecificTimeDOWLocationForAppInContext:v20];
                break;
              case 757:
                [v23 setAppDirectoryRejectsAtSpecificTimeDOWLocationInContext:v20];
                break;
              case 758:
                [v23 setAppDirectoryRejectsAtSpecificTimeDOWLocationForApp:v20];
                break;
              case 759:
                [v23 setHomeScreenAppConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate:v20];
                break;
              case 760:
                [v23 setHomeScreenAppConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate:v20];
                break;
              case 761:
                [v23 setHomeScreenAppRejectsForAllAppsAndContextsDecayedAtCoarseContextRate:v20];
                break;
              case 762:
                [v23 setHomeScreenAppRejectsForAllAppsAndContextsDecayedAtSpecificContextRate:v20];
                break;
              case 763:
                [v23 setHomeScreenAppExplicitRejectsForAllAppsAndContextsDecayedAtCoarseContextRate:v20];
                break;
              case 764:
                [v23 setAppDirectoryConfirmsForAllAppsAndContextsDecayedAtCoarseContextRate:v20];
                break;
              case 765:
                [v23 setAppDirectoryConfirmsForAllAppsAndContextsDecayedAtSpecificContextRate:v20];
                break;
              case 766:
                [v23 setAppDirectoryRejectsForAllAppsAndContextsDecayedAtCoarseContextRate:v20];
                break;
              case 767:
                [v23 setAppDirectoryRejectsForAllAppsAndContextsDecayedAtSpecificContextRate:v20];
                break;
              case 768:
                [v23 setAppDirectoryExplicitRejectsForAllAppsAndContextsDecayedAtCoarseContextRate:v20];
                break;
              case 769:
                [v23 setIsAppClip:v20];
                break;
              case 770:
                [v23 setHomeScreenActionConfirmsOnDayOfWeekForActionInContext:v20];
                break;
              case 771:
                [v23 setHomeScreenActionConfirmsOnDayOfWeekInContext:v20];
                break;
              case 772:
                [v23 setHomeScreenActionConfirmsOnDayOfWeekForAction:v20];
                break;
              case 773:
                [v23 setHomeScreenActionConfirmsAtTimeOfDayForActionInContext:v20];
                break;
              case 774:
                [v23 setHomeScreenActionConfirmsAtTimeOfDayInContext:v20];
                break;
              case 775:
                [v23 setHomeScreenActionConfirmsAtTimeOfDayForAction:v20];
                break;
              case 776:
                [v23 setHomeScreenActionConfirmsAtCoarseGeohashForActionInContext:v20];
                break;
              case 777:
                [v23 setHomeScreenActionConfirmsAtCoarseGeohashInContext:v20];
                break;
              case 778:
                [v23 setHomeScreenActionConfirmsAtCoarseGeohashForAction:v20];
                break;
              case 779:
                [v23 setHomeScreenActionConfirmsAtSpecificGeohashForActionInContext:v20];
                break;
              case 780:
                [v23 setHomeScreenActionConfirmsAtSpecificGeohashInContext:v20];
                break;
              case 781:
                [v23 setHomeScreenActionConfirmsAtSpecificGeohashForAction:v20];
                break;
              case 782:
                [v23 setHomeScreenActionConfirmsAtCoarseTimePOWLocationForActionInContext:v20];
                break;
              case 783:
                [v23 setHomeScreenActionConfirmsAtCoarseTimePOWLocationInContext:v20];
                break;
              case 784:
                [v23 setHomeScreenActionConfirmsAtCoarseTimePOWLocationForAction:v20];
                break;
              case 785:
                [v23 setHomeScreenActionConfirmsAtSpecificTimeDOWLocationForActionInContext:v20];
                break;
              case 786:
                [v23 setHomeScreenActionConfirmsAtSpecificTimeDOWLocationInContext:v20];
                break;
              case 787:
                [v23 setHomeScreenActionConfirmsAtSpecificTimeDOWLocationForAction:v20];
                break;
              case 788:
                [v23 setHomeScreenActionRejectsOnDayOfWeekForActionInContext:v20];
                break;
              case 789:
                [v23 setHomeScreenActionRejectsOnDayOfWeekInContext:v20];
                break;
              case 790:
                [v23 setHomeScreenActionRejectsOnDayOfWeekForAction:v20];
                break;
              case 791:
                [v23 setHomeScreenActionRejectsAtTimeOfDayForActionInContext:v20];
                break;
              case 792:
                [v23 setHomeScreenActionRejectsAtTimeOfDayInContext:v20];
                break;
              case 793:
                [v23 setHomeScreenActionRejectsAtTimeOfDayForAction:v20];
                break;
              case 794:
                [v23 setHomeScreenActionRejectsAtCoarseGeohashForActionInContext:v20];
                break;
              case 795:
                [v23 setHomeScreenActionRejectsAtCoarseGeohashInContext:v20];
                break;
              case 796:
                [v23 setHomeScreenActionRejectsAtCoarseGeohashForAction:v20];
                break;
              case 797:
                [v23 setHomeScreenActionRejectsAtSpecificGeohashForActionInContext:v20];
                break;
              case 798:
                [v23 setHomeScreenActionRejectsAtSpecificGeohashInContext:v20];
                break;
              case 799:
                [v23 setHomeScreenActionRejectsAtSpecificGeohashForAction:v20];
                break;
              case 800:
                [v23 setHomeScreenActionRejectsAtCoarseTimePOWLocationForActionInContext:v20];
                break;
              case 801:
                [v23 setHomeScreenActionRejectsAtCoarseTimePOWLocationInContext:v20];
                break;
              case 802:
                [v23 setHomeScreenActionRejectsAtCoarseTimePOWLocationForAction:v20];
                break;
              case 803:
                [v23 setHomeScreenActionRejectsAtSpecificTimeDOWLocationForActionInContext:v20];
                break;
              case 804:
                [v23 setHomeScreenActionRejectsAtSpecificTimeDOWLocationInContext:v20];
                break;
              case 805:
                [v23 setHomeScreenActionRejectsAtSpecificTimeDOWLocationForAction:v20];
                break;
              case 806:
                [v23 setPoiPopularityForAppInContext:v20];
                break;
              case 807:
                [v23 setAppLaunchPopularityAtPOIForAppInContext:v20];
                break;
              case 808:
                [v23 setPoiCategory:v20];
                break;
              case 809:
                [v23 setAppLaunchesAtPOIForAppInContext:v20];
                break;
              case 810:
                [v23 setAppCategoryScore:v20];
                break;
              case 811:
                [v23 setPosteriorProbabilityOfAppGivenMode:v20];
                break;
              case 812:
                [v23 setClassConditionalProbabilityOfModeGivenApp:v20];
                break;
              case 813:
                [v23 setUniqueOccurrencesOfAppInMode:v20];
                break;
              case 814:
                [v23 setLocalOccurrencesOfAppInMode:v20];
                break;
              case 815:
                [v23 setGlobalOccurrencesOfAppInMode:v20];
                break;
              case 816:
                [v23 setAppModeEntityScore:v20];
                break;
              default:
                break;
            }
          }
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v21 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v6 = v21;
    }
    while (v21);
  }

  return v23;
}

+ (int)awdConsumerSubTypeWithConsumerSubType:(unsigned __int8)a3
{
  if ((a3 - 1) > 0x2F) {
    return 0;
  }
  else {
    return dword_1D142B558[(char)(a3 - 1)];
  }
}

+ (int)awdLOITypeWithRTLOI:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return dword_1D142B650[a3];
  }
}

+ (int)awdActionEngagementWithEngagement:(unint64_t)a3
{
  if (a3 - 1 < 0xA) {
    return a3;
  }
  else {
    return 0;
  }
}

+ (int)awdActionTypeWithActionType:(unint64_t)a3
{
  int result = 0;
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      int result = 1;
      break;
    case 2uLL:
      int result = 2;
      break;
    case 3uLL:
      id v4 = __atxlog_handle_default();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        +[ATXAWDUtils awdActionTypeWithActionType:](v4);
      }

      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"awdActionTypeWithActionType called with invalid ATXActionType value of %tu", 3);
      goto LABEL_7;
    case 5uLL:
      int result = 5;
      break;
    case 6uLL:
      int result = 3;
      break;
    default:
LABEL_7:
      int result = 4;
      break;
  }
  return result;
}

+ (int)awdAppLaunchReasonWithString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (launchReasonMap)
  {
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    launchReasonMap = (uint64_t)&unk_1F27F3B78;

    if (!v4)
    {
LABEL_8:
      LODWORD(v5) = 0;
      goto LABEL_9;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v5 = [(id)launchReasonMap objectForKeyedSubscript:v4];

  if (v5)
  {
    uint64_t v6 = [(id)launchReasonMap objectForKeyedSubscript:v4];
    LODWORD(v5) = [v6 intValue];
  }
LABEL_9:

  return (int)v5;
}

+ (int)awdMotionTypeWithMotionType:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 2;
  }
  else {
    return dword_1D142B618[a3];
  }
}

+ (id)appDataAtIndex:(unint64_t)a3 forSessionLogDict:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [v5 objectForKeyedSubscript:@"AppData"];
  v8 = [v7 objectAtIndexedSubscript:a3];
  uint64_t v9 = +[ATXAWDUtils subscoresWithDictionary:v8];

  [v6 setSubscores:v9];
  double v10 = [v5 objectForKeyedSubscript:@"AppData"];
  uint64_t v11 = [v10 objectAtIndexedSubscript:a3];
  int v12 = [v11 objectForKeyedSubscript:@"Score"];

  if (v12)
  {
    v13 = [v5 objectForKeyedSubscript:@"AppData"];
    v14 = [v13 objectAtIndexedSubscript:a3];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"Score"];
    [v15 doubleValue];
    objc_msgSend(v6, "setScore:");
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:@"EngagedApp"];
  if (v16)
  {
    v17 = (void *)v16;
    double v18 = [v5 objectForKeyedSubscript:@"EngagedApp"];
    int v19 = [v18 intValue];

    if (v19 != -1) {
      [v6 setEngagedApp:a3 == 0];
    }
  }
  uint64_t v20 = [v5 objectForKeyedSubscript:@"AppData"];
  uint64_t v21 = [v20 objectAtIndexedSubscript:a3];
  v22 = [v21 objectForKeyedSubscript:@"BundleId"];

  if (v22)
  {
    id v23 = [v5 objectForKeyedSubscript:@"AppData"];
    long long v24 = [v23 objectAtIndexedSubscript:a3];
    long long v25 = [v24 objectForKeyedSubscript:@"BundleId"];
    [v6 setBundleId:v25];
  }
  return v6;
}

+ (id)populateAwdAppPredictionSessionForSessionLogDict:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [v4 objectForKey:@"CoreMotionLaunches"];

  if (v6)
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"CoreMotionLaunches"];
    objc_msgSend(v5, "setCoreMotionLaunches:", objc_msgSend(v7, "intValue"));
  }
  v8 = [v4 objectForKey:@"TotalAirplaneModeLaunches"];

  if (v8)
  {
    uint64_t v9 = [v4 objectForKeyedSubscript:@"TotalAirplaneModeLaunches"];
    objc_msgSend(v5, "setTotalAirplaneModeLaunches:", objc_msgSend(v9, "intValue"));
  }
  double v10 = [v4 objectForKey:@"InAirplaneMode"];

  if (v10)
  {
    uint64_t v11 = [v4 objectForKeyedSubscript:@"InAirplaneMode"];
    objc_msgSend(v5, "setInAirplaneMode:", objc_msgSend(v11, "intValue") != 0);
  }
  int v12 = [v4 objectForKey:@"CoreMotionCurrentMotionLaunches"];

  if (v12)
  {
    v13 = [v4 objectForKeyedSubscript:@"CoreMotionCurrentMotionLaunches"];
    objc_msgSend(v5, "setCoreMotionCurrentMotionLaunches:", objc_msgSend(v13, "intValue"));
  }
  v14 = [v4 objectForKey:@"TotalSpotlightLaunches"];

  if (v14)
  {
    uint64_t v15 = [v4 objectForKeyedSubscript:@"TotalSpotlightLaunches"];
    objc_msgSend(v5, "setTotalSpotlightLaunches:", objc_msgSend(v15, "intValue"));
  }
  uint64_t v16 = [v4 objectForKey:@"TotalLaunchSequences"];

  if (v16)
  {
    v17 = [v4 objectForKeyedSubscript:@"TotalLaunchSequences"];
    objc_msgSend(v5, "setTotalLaunchSequences:", objc_msgSend(v17, "intValue"));
  }
  double v18 = [v4 objectForKey:@"TotalCurrentDayOfWeekLaunches"];

  if (v18)
  {
    int v19 = [v4 objectForKeyedSubscript:@"TotalCurrentDayOfWeekLaunches"];
    objc_msgSend(v5, "setTotalCurrentDayOfWeekLaunches:", objc_msgSend(v19, "intValue"));
  }
  uint64_t v20 = [v4 objectForKey:@"TotalWifiLaunches"];

  if (v20)
  {
    uint64_t v21 = [v4 objectForKeyedSubscript:@"TotalWifiLaunches"];
    objc_msgSend(v5, "setTotalWifiLaunches:", objc_msgSend(v21, "intValue"));
  }
  v22 = [v4 objectForKey:@"TimeOfDayInterval"];

  if (v22)
  {
    id v23 = [v4 objectForKeyedSubscript:@"TimeOfDayInterval"];
    objc_msgSend(v5, "setTimeOfDayInterval:", objc_msgSend(v23, "intValue"));
  }
  long long v24 = [v4 objectForKey:@"TotalLaunches"];

  if (v24)
  {
    long long v25 = [v4 objectForKeyedSubscript:@"TotalLaunches"];
    objc_msgSend(v5, "setTotalLaunches:", objc_msgSend(v25, "intValue"));
  }
  long long v26 = [v4 objectForKey:@"EngagedApp"];

  if (v26)
  {
    long long v27 = [v4 objectForKeyedSubscript:@"EngagedApp"];
    objc_msgSend(v5, "setEngagedApp:", objc_msgSend(v27, "intValue"));
  }
  v28 = [v4 objectForKey:@"TotalTrendingLaunches"];

  if (v28)
  {
    uint64_t v29 = [v4 objectForKeyedSubscript:@"TotalTrendingLaunches"];
    objc_msgSend(v5, "setTotalTrendingLaunches:", objc_msgSend(v29, "intValue"));
  }
  v30 = [v4 objectForKey:@"TotalTimeOfDayLaunches"];

  if (v30)
  {
    v31 = [v4 objectForKeyedSubscript:@"TotalTimeOfDayLaunches"];
    objc_msgSend(v5, "setTotalTimeOfDayLaunches:", objc_msgSend(v31, "intValue"));
  }
  v32 = [v4 objectForKey:@"TotalSSIDLaunches"];

  if (v32)
  {
    v33 = [v4 objectForKeyedSubscript:@"TotalSSIDLaunches"];
    objc_msgSend(v5, "setTotalSSIDLaunches:", objc_msgSend(v33, "intValue"));
  }
  v34 = [v4 objectForKey:@"LocationDistanceFromHome"];

  if (v34)
  {
    v35 = [v4 objectForKeyedSubscript:@"LocationDistanceFromHome"];
    objc_msgSend(v5, "setLocationDistanceFromHome:", objc_msgSend(v35, "intValue"));
  }
  v36 = [v4 objectForKey:@"LocationDistanceFromWork"];

  if (v36)
  {
    v37 = [v4 objectForKeyedSubscript:@"LocationDistanceFromWork"];
    objc_msgSend(v5, "setLocationDistanceFromWork:", objc_msgSend(v37, "intValue"));
  }
  v38 = [v4 objectForKey:@"LocationDistanceFromSchool"];

  if (v38)
  {
    v39 = [v4 objectForKeyedSubscript:@"LocationDistanceFromSchool"];
    objc_msgSend(v5, "setLocationDistanceFromSchool:", objc_msgSend(v39, "intValue"));
  }
  v40 = [v4 objectForKey:@"LocationDistanceFromGym"];

  if (v40)
  {
    v41 = [v4 objectForKeyedSubscript:@"LocationDistanceFromGym"];
    objc_msgSend(v5, "setLocationDistanceFromGym:", objc_msgSend(v41, "intValue"));
  }
  v42 = [v4 objectForKey:@"IsInternalBuild"];

  if (v42)
  {
    v43 = [v4 objectForKeyedSubscript:@"IsInternalBuild"];
    objc_msgSend(v5, "setIsInternalBuild:", objc_msgSend(v43, "BOOLValue"));
  }
  v44 = [v4 objectForKey:@"PredictionCacheAge"];

  if (v44)
  {
    v45 = [v4 objectForKeyedSubscript:@"PredictionCacheAge"];
    objc_msgSend(v5, "setPredictionCacheAge:", objc_msgSend(v45, "intValue"));
  }
  v46 = [v4 objectForKey:@"session_log_version"];

  if (v46)
  {
    v47 = [v4 objectForKeyedSubscript:@"session_log_version"];
    objc_msgSend(v5, "setSessionLogVersion:", objc_msgSend(v47, "intValue"));
  }
  v48 = [v4 objectForKey:@"TotalSpotlightTimeOfDayLaunches"];

  if (v48)
  {
    v49 = [v4 objectForKeyedSubscript:@"TotalSpotlightTimeOfDayLaunches"];
    objc_msgSend(v5, "setTotalSpotlightLaunches:", objc_msgSend(v49, "intValue"));
  }
  v50 = [v4 objectForKey:@"TotalDayOfWeekLaunches"];

  if (v50)
  {
    v51 = [v4 objectForKeyedSubscript:@"TotalDayOfWeekLaunches"];
    objc_msgSend(v5, "setTotalDayOfWeekLaunches:", objc_msgSend(v51, "intValue"));
  }
  v52 = [v4 objectForKey:@"APRFeedbackSource"];

  if (v52)
  {
    v53 = [v4 objectForKeyedSubscript:@"APRFeedbackSource"];
    [v5 setAPRFeedbackSource:v53];
  }
  v54 = [v4 objectForKey:@"APREngagementType"];

  if (v54)
  {
    v55 = [v4 objectForKeyedSubscript:@"APREngagementType"];
    [v5 setAPREngagementType:v55];
  }
  v56 = [v4 objectForKey:@"APRSiriExperience"];

  if (v56)
  {
    v57 = [v4 objectForKeyedSubscript:@"APRSiriExperience"];
    [v5 setAPRSiriExperience:v57];
  }
  v58 = [v4 objectForKey:@"IntentType"];

  if (v58)
  {
    v59 = [v4 objectForKeyedSubscript:@"IntentType"];
    [v5 setIntentType:v59];
  }
  v60 = [v4 objectForKey:@"ConsumerType"];

  if (v60)
  {
    v61 = [v4 objectForKeyedSubscript:@"ConsumerType"];
    [v5 setConsumerType:v61];
  }
  v62 = [v4 objectForKey:@"ConsumerSubType"];

  if (v62)
  {
    char v76 = 0;
    v63 = (void *)MEMORY[0x1E4F4B680];
    v64 = [v4 objectForKeyedSubscript:@"ConsumerSubType"];
    uint64_t v65 = [v63 consumerSubtypeForString:v64 found:&v76];

    if (v76) {
      objc_msgSend(v5, "setConsumerSubType:", +[ATXAWDUtils awdConsumerSubTypeWithConsumerSubType:](ATXAWDUtils, "awdConsumerSubTypeWithConsumerSubType:", v65));
    }
  }
  v66 = [v4 objectForKey:@"CurrentLOIType"];

  if (v66)
  {
    v67 = [v4 objectForKeyedSubscript:@"CurrentLOIType"];
    objc_msgSend(v5, "setCurrentLOIType:", objc_msgSend(a1, "AWDLOITypeForString:", v67));
  }
  v68 = [v4 objectForKey:@"AppSequence"];

  if (v68)
  {
    v69 = [v4 objectForKeyedSubscript:@"AppSequence"];
    [v5 setAppSequences:v69];
  }
  v70 = [v4 objectForKey:@"Outcome"];

  if (v70)
  {
    v71 = [v4 objectForKeyedSubscript:@"Outcome"];
    objc_msgSend(v5, "setOutcome:", objc_msgSend(a1, "awdPredictionOutcomeWithATXPredictionOutcome:", (int)objc_msgSend(v71, "intValue")));
  }
  v72 = [v4 objectForKey:@"ABGroup"];

  if (v72)
  {
    v73 = [v4 objectForKeyedSubscript:@"ABGroup"];
    [v5 setABGroup:v73];
  }
  id v74 = v5;

  return v74;
}

+ (void)logAppPredictionDictionaryViaAWD:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"AppData"];

    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F29128]);
      uint64_t v7 = [v6 UUIDString];

      v8 = [v4 objectForKeyedSubscript:@"AppData"];
      if ([v8 count])
      {
        unint64_t v9 = 0;
        do
        {
          double v10 = +[ATXAWDUtils appDataAtIndex:v9 forSessionLogDict:v4];
          [v10 setSessionId:v7];
          AWDPostMetric();
          uint64_t v11 = __atxlog_handle_feedback();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            int v12 = [v10 bundleId];
            int v13 = [v10 engagedApp];
            *(_DWORD *)buf = 138412546;
            v14 = @"NO";
            if (v13) {
              v14 = @"YES";
            }
            id v23 = v12;
            __int16 v24 = 2112;
            long long v25 = v14;
            _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXAppPredictorSessionLog - logged AWDProactiveAppData with bundleId: %@ engagedApp: %@", buf, 0x16u);
          }
          ++v9;
        }
        while (v9 < [v8 count]);
      }
      uint64_t v15 = +[ATXAWDUtils populateAwdAppPredictionSessionForSessionLogDict:v4];
      [v15 setSessionId:v7];
      AWDPostMetric();
      uint64_t v16 = __atxlog_handle_feedback();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v15 consumerSubType];
        if (v17 >= 0x28)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
          double v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          double v18 = off_1E68AF2F0[(int)v17];
        }
        int v19 = v18;
        uint64_t v20 = [v15 outcome];
        if (v20 >= 9)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v20);
          uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v21 = off_1E68AF430[(int)v20];
        }
        *(_DWORD *)buf = 138412546;
        id v23 = v19;
        __int16 v24 = 2112;
        long long v25 = v21;
        _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "ATXAppPredictorSessionLog - logged AWDProactiveAppPredictionSession with consumerSubType: %@ engagementType: %@", buf, 0x16u);
      }
    }
  }
}

+ (int)awdPredictionOutcomeWithATXPredictionOutcome:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return 0;
  }
  else {
    return dword_1D142B62C[a3 - 1];
  }
}

+ (int)AWDLOITypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Work"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Home"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Gym"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (void)awdScoreWithScore:type:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_8();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "int32_t underflow for score of %f for scoreType: %lu", v1, 0x16u);
}

+ (void)awdScoreWithScore:type:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_8();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "int32_t overflow for score of %f for scoreType: %lu", v1, 0x16u);
}

+ (void)awdActionTypeWithActionType:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = 3;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "awdActionTypeWithActionType called with invalid ATXActionType value of %tu", (uint8_t *)&v1, 0xCu);
}

@end