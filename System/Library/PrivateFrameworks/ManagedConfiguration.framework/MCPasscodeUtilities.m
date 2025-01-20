@interface MCPasscodeUtilities
+ (id)defaultPublicDictionaryForUMUserPasscodeType:(unint64_t)a3;
+ (int)unlockScreenTypeForPasscode:(id)a3 outSimplePasscodeType:(int *)a4;
+ (int)unlockScreenTypeForUMUserPasscodeType:(unint64_t)a3 outSimplePasscodeType:(int *)a4;
@end

@implementation MCPasscodeUtilities

+ (int)unlockScreenTypeForPasscode:(id)a3 outSimplePasscodeType:(int *)a4
{
  v5 = +[MCPasscodeManager characteristicsDictionaryFromPasscode:a3];
  LODWORD(a4) = +[MCPasscodeManager unlockScreenTypeForPasscodeCharacteristics:v5 outSimplePasscodeType:a4];

  return (int)a4;
}

+ (int)unlockScreenTypeForUMUserPasscodeType:(unint64_t)a3 outSimplePasscodeType:(int *)a4
{
  if (a3 > 2)
  {
    int result = 2;
    int v4 = -1;
    if (!a4) {
      return result;
    }
    goto LABEL_5;
  }
  int v4 = dword_1A14DCC00[a3];
  int result = dword_1A14DCC0C[a3];
  if (a4) {
LABEL_5:
  }
    *a4 = v4;
  return result;
}

+ (id)defaultPublicDictionaryForUMUserPasscodeType:(unint64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  unsigned int v8 = 0;
  uint64_t v3 = [a1 unlockScreenTypeForUMUserPasscodeType:a3 outSimplePasscodeType:&v8];
  v9[0] = @"simpleType";
  int v4 = [MEMORY[0x1E4F28ED0] numberWithInt:v8];
  v10[0] = v4;
  v9[1] = @"keyboardType";
  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v3];
  v10[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v6;
}

@end