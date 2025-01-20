@interface IATextInputActionsUtils
+ (BOOL)isEmojiSearchSetInFlagOptions:(int64_t)a3;
+ (BOOL)isMarkedTextSetInFlagOptions:(int64_t)a3;
+ (BOOL)isWebSetInFlagOptions:(int64_t)a3;
+ (id)stringForKeyboardDockItemButtonPressResult:(unint64_t)a3;
+ (id)stringForKeyboardDockItemButtonType:(unint64_t)a3;
+ (id)stringForReplaceWithCandidateType:(int64_t)a3;
+ (id)stringForSessionActionsEnum:(int64_t)a3;
+ (id)stringForSource:(int64_t)a3;
+ (id)stringForType:(int64_t)a3;
+ (int64_t)sessionActionsEnumFromSource:(int64_t)a3;
+ (int64_t)sessionActionsEnumFromSource:(int64_t)a3 type:(int64_t)a4;
+ (int64_t)setBool:(BOOL)a3 forField:(int64_t)a4 inFlagOptions:(int64_t)a5;
+ (int64_t)setEmojiSearch:(BOOL)a3 inFlagOptions:(int64_t)a4;
+ (int64_t)setMarkedText:(BOOL)a3 inFlagOptions:(int64_t)a4;
+ (int64_t)setWeb:(BOOL)a3 inFlagOptions:(int64_t)a4;
+ (unint64_t)log10IntegerForInt:(int64_t)a3;
+ (unint64_t)log10WholeNumberForUnsignedInt:(unint64_t)a3;
@end

@implementation IATextInputActionsUtils

+ (int64_t)setBool:(BOOL)a3 forField:(int64_t)a4 inFlagOptions:(int64_t)a5
{
  if (a3) {
    return a5 | a4;
  }
  else {
    return a5 & ~a4;
  }
}

+ (BOOL)isEmojiSearchSetInFlagOptions:(int64_t)a3
{
  return a3 & 1;
}

+ (int64_t)setEmojiSearch:(BOOL)a3 inFlagOptions:(int64_t)a4
{
  return MEMORY[0x270F9A6D0](a1, sel_setBool_forField_inFlagOptions_, a3, 1);
}

+ (BOOL)isMarkedTextSetInFlagOptions:(int64_t)a3
{
  return ((unint64_t)a3 >> 1) & 1;
}

+ (int64_t)setMarkedText:(BOOL)a3 inFlagOptions:(int64_t)a4
{
  return MEMORY[0x270F9A6D0](a1, sel_setBool_forField_inFlagOptions_, a3, 2);
}

+ (BOOL)isWebSetInFlagOptions:(int64_t)a3
{
  return ((unint64_t)a3 >> 2) & 1;
}

+ (int64_t)setWeb:(BOOL)a3 inFlagOptions:(int64_t)a4
{
  return MEMORY[0x270F9A6D0](a1, sel_setBool_forField_inFlagOptions_, a3, 4);
}

+ (id)stringForSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE) {
    return @"Unspecified";
  }
  else {
    return off_265387198[a3 - 1];
  }
}

+ (id)stringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x10) {
    return @"Unspecified";
  }
  else {
    return off_265387210[a3 - 1];
  }
}

+ (id)stringForReplaceWithCandidateType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"CandidateUnknown";
  }
  else {
    return off_265387298[a3 - 1];
  }
}

+ (int64_t)sessionActionsEnumFromSource:(int64_t)a3 type:(int64_t)a4
{
  int64_t result = objc_msgSend_sessionActionsEnumFromSource_(IATextInputActionsUtils, a2, a3, a4);
  if (result != 1) {
    return result;
  }
  if (a3 == 12)
  {
    if (a4 != 15) {
      return 0;
    }
    return 10;
  }
  if (a3 == 4)
  {
    if (a4 <= 14)
    {
      if (a4 == 1) {
        return 6;
      }
      if (a4 == 2) {
        return 7;
      }
      return 0;
    }
    if (a4 != 15)
    {
      if (a4 == 16) {
        return 11;
      }
      return 0;
    }
    return 10;
  }
  if (a3 != 3) {
    return 0;
  }
  int64_t v7 = 5;
  if (a4 != 1) {
    int64_t v7 = 0;
  }
  if (a4 == 15) {
    return 10;
  }
  else {
    return v7;
  }
}

+ (int64_t)sessionActionsEnumFromSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE) {
    return 2;
  }
  else {
    return qword_252A14D50[a3 - 1];
  }
}

+ (id)stringForSessionActionsEnum:(int64_t)a3
{
  if ((unint64_t)a3 > 0xD) {
    return @"U";
  }
  else {
    return off_2653872B0[a3];
  }
}

+ (id)stringForKeyboardDockItemButtonPressResult:(unint64_t)a3
{
  if (a3 > 3) {
    return @"?";
  }
  else {
    return off_265387320[a3];
  }
}

+ (id)stringForKeyboardDockItemButtonType:(unint64_t)a3
{
  if (a3 > 2) {
    return @"?";
  }
  else {
    return off_265387340[a3];
  }
}

+ (unint64_t)log10WholeNumberForUnsignedInt:(unint64_t)a3
{
  unint64_t v3 = 1;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  uint64_t v6 = 4;
  if (a3 >> 4 >= 0x271) {
    uint64_t v6 = 5;
  }
  if (a3 >= 0x3E8) {
    uint64_t v5 = v6;
  }
  if (a3 >= 0x64) {
    uint64_t v4 = v5;
  }
  if (a3 >= 0xA) {
    unint64_t v3 = v4;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (unint64_t)log10IntegerForInt:(int64_t)a3
{
  if (a3 < -9999) {
    return 0;
  }
  if (a3 < -999) {
    return 1;
  }
  if (a3 < -99) {
    return 2;
  }
  if (a3 < -9) {
    return 3;
  }
  if (a3 < 0) {
    return 4;
  }
  if (!a3) {
    return 5;
  }
  if ((unint64_t)a3 < 0xA) {
    return 6;
  }
  if ((unint64_t)a3 < 0x64) {
    return 7;
  }
  if ((unint64_t)a3 < 0x3E8) {
    return 8;
  }
  if ((unint64_t)a3 >> 4 < 0x271) {
    return 9;
  }
  return 10;
}

@end