@interface HKQuantityType(ManualEntryValidation)
+ (void)typeIdentifiersSupportingManualEntryValidation;
- (uint64_t)validateQuantityForManualEntry:()ManualEntryValidation;
@end

@implementation HKQuantityType(ManualEntryValidation)

+ (void)typeIdentifiersSupportingManualEntryValidation
{
  return &unk_1F3C1F078;
}

- (uint64_t)validateQuantityForManualEntry:()ManualEntryValidation
{
  id v4 = a3;
  uint64_t v5 = [a1 code];
  uint64_t v6 = 2;
  switch(v5)
  {
    case 0:
      v7 = @"count";
      double v8 = 75.0;
      double v12 = 55.0;
      double v10 = 7.0;
      goto LABEL_97;
    case 1:
      v7 = @"%";
      double v11 = 0.04;
      double v12 = 0.65;
      double v10 = 0.0;
      double v8 = 0.75;
      goto LABEL_129;
    case 2:
      v7 = @"cm";
      double v8 = 300.0;
      double v11 = 100.0;
      double v12 = 274.0;
      goto LABEL_26;
    case 3:
      v7 = @"lb";
      double v8 = 800.0;
      double v11 = 50.0;
      double v12 = 440.0;
      double v10 = 5.0;
      goto LABEL_129;
    case 4:
      v7 = @"lb";
      double v8 = 275.0;
      double v11 = 70.0;
      double v12 = 210.0;
      goto LABEL_26;
    case 5:
      v7 = @"count/min";
      double v8 = 350.0;
      double v11 = 40.0;
      double v12 = 220.0;
      goto LABEL_26;
    case 6:
    case 11:
    case 59:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 74:
    case 75:
    case 76:
    case 77:
    case 79:
    case 80:
    case 81:
    case 82:
    case 84:
    case 85:
    case 86:
    case 88:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 112:
    case 115:
    case 116:
    case 117:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 159:
    case 160:
    case 161:
    case 162:
    case 163:
    case 164:
    case 165:
    case 166:
    case 167:
    case 168:
    case 169:
    case 170:
    case 171:
    case 172:
    case 173:
    case 174:
    case 175:
    case 176:
    case 177:
    case 178:
    case 179:
    case 180:
    case 181:
    case 184:
    case 185:
    case 186:
    case 189:
    case 190:
    case 191:
    case 192:
    case 193:
      goto LABEL_131;
    case 7:
      v7 = @"count";
      double v8 = 90000.0;
      double v12 = 65000.0;
      goto LABEL_128;
    case 8:
    case 113:
      v7 = @"mi";
      double v8 = 100.0;
      goto LABEL_60;
    case 9:
      v7 = @"kcal";
      double v8 = 3500.0;
      goto LABEL_62;
    case 10:
      v7 = @"kcal";
      goto LABEL_49;
    case 12:
      v7 = @"count";
      double v8 = 500.0;
      goto LABEL_115;
    case 13:
      v7 = @"count";
      double v8 = 15000.0;
      goto LABEL_93;
    case 14:
      v7 = @"%";
      double v10 = 0.7;
      double v11 = 0.9;
      double v8 = 1.0;
      goto LABEL_22;
    case 15:
      v7 = @"mg/dL";
      double v8 = 900.0;
      double v11 = 50.0;
      double v12 = 300.0;
LABEL_118:
      double v10 = 0.0;
      goto LABEL_129;
    case 16:
      v7 = @"mmHg";
      double v10 = 40.0;
      double v8 = 300.0;
      double v11 = 80.0;
      double v12 = 180.0;
      goto LABEL_129;
    case 17:
      v7 = @"mmHg";
      double v8 = 200.0;
      double v11 = 40.0;
      double v12 = 90.0;
LABEL_26:
      double v10 = 30.0;
      goto LABEL_129;
    case 18:
      v7 = @"%";
      double v8 = 0.004;
      double v12 = 0.0024;
      goto LABEL_128;
    case 19:
      v7 = @"%";
      double v8 = 0.2;
      double v12 = 0.1;
      goto LABEL_128;
    case 20:
      v7 = @"g";
      double v8 = 500.0;
      goto LABEL_40;
    case 21:
      v7 = @"g";
      double v8 = 100.0;
      double v12 = 66.0;
      goto LABEL_128;
    case 22:
      v7 = @"g";
      double v8 = 150.0;
      goto LABEL_47;
    case 23:
      v7 = @"g";
      double v8 = 120.0;
      goto LABEL_53;
    case 24:
      v7 = @"mg";
      double v8 = 3500.0;
      goto LABEL_84;
    case 25:
      v7 = @"mg";
      double v8 = 9600.0;
      double v12 = 4800.0;
      goto LABEL_128;
    case 26:
      v7 = @"g";
      double v8 = 900.0;
      double v12 = 450.0;
      goto LABEL_128;
    case 27:
      v7 = @"g";
      double v8 = 125.0;
      goto LABEL_47;
    case 28:
      v7 = @"g";
      double v8 = 1000.0;
      double v12 = 500.0;
      goto LABEL_128;
    case 29:
      v7 = @"kcal";
      double v8 = 6000.0;
      double v12 = 3500.0;
      goto LABEL_128;
    case 30:
      v7 = @"g";
      double v8 = 400.0;
LABEL_40:
      double v12 = 250.0;
      goto LABEL_128;
    case 31:
      v7 = @"mcg";
      double v8 = 200000.0;
      double v12 = 20000.0;
      goto LABEL_128;
    case 32:
      v7 = @"mg";
      double v8 = 700.0;
      goto LABEL_60;
    case 33:
      v7 = @"mcg";
      double v8 = 20000.0;
      double v12 = 300.0;
      goto LABEL_128;
    case 34:
      v7 = @"mg";
      double v8 = 20000.0;
      goto LABEL_103;
    case 35:
      v7 = @"mcg";
      goto LABEL_52;
    case 36:
      v7 = @"mg";
      double v8 = 5000.0;
LABEL_47:
      double v12 = 75.0;
      goto LABEL_128;
    case 37:
      v7 = @"mcg";
LABEL_49:
      double v8 = 10000.0;
      double v12 = 4000.0;
      goto LABEL_128;
    case 38:
      v7 = @"mg";
      double v8 = 4000.0;
      goto LABEL_84;
    case 39:
      v7 = @"mg";
LABEL_52:
      double v8 = 1000.0;
LABEL_53:
      uint64_t v9 = 0x404E000000000000;
      goto LABEL_127;
    case 40:
      v7 = @"mg";
      double v10 = 0.0;
      double v8 = 18.0;
      double v11 = 0.0;
      double v12 = 4.5;
      goto LABEL_129;
    case 41:
      v7 = @"mg";
      double v8 = 800.0;
      double v10 = 0.0;
LABEL_108:
      double v11 = 0.0;
LABEL_109:
      double v12 = 10.0;
      goto LABEL_129;
    case 42:
      v7 = @"mg";
      double v8 = 9000.0;
      uint64_t v9 = 0x4054000000000000;
      goto LABEL_127;
    case 43:
      v7 = @"mcg";
      double v8 = 2400.0;
      double v12 = 1800.0;
      goto LABEL_128;
    case 44:
      v7 = @"mcg";
      double v8 = 5000000.0;
      goto LABEL_93;
    case 45:
      v7 = @"mg";
      double v8 = 2000.0;
LABEL_60:
      double v10 = 0.0;
      double v11 = 0.0;
LABEL_121:
      double v12 = 30.0;
      goto LABEL_129;
    case 46:
      v7 = @"mg";
      double v8 = 6000.0;
LABEL_62:
      double v12 = 2500.0;
      goto LABEL_128;
    case 47:
      v7 = @"mcg";
      double v8 = 200000.0;
      goto LABEL_103;
    case 48:
      v7 = @"mg";
      double v8 = 4000.0;
      goto LABEL_103;
    case 49:
      v7 = @"mg";
      double v8 = 600.0;
LABEL_115:
      double v12 = 150.0;
      goto LABEL_128;
    case 50:
      v7 = @"mcg";
      double v8 = 2000.0;
LABEL_126:
      uint64_t v9 = 0x4069000000000000;
      goto LABEL_127;
    case 51:
      v7 = @"mg";
      double v10 = 0.0;
      double v8 = 8.0;
      double v11 = 0.0;
      double v12 = 4.0;
      goto LABEL_129;
    case 52:
      v7 = @"mg";
      double v10 = 0.0;
      double v8 = 20.0;
      double v11 = 0.0;
      goto LABEL_79;
    case 53:
      v7 = @"mcg";
      double v8 = 500.0;
      goto LABEL_5;
    case 54:
      v7 = @"mcg";
      double v8 = 500.0;
      double v12 = 225.0;
      goto LABEL_128;
    case 55:
      v7 = @"mg";
      double v8 = 14000.0;
      double v12 = 7000.0;
      goto LABEL_128;
    case 56:
      v7 = @"mg";
      double v8 = 20000.0;
      goto LABEL_93;
    case 57:
      v7 = @"count";
      double v10 = 0.0;
      double v8 = 30.0;
      double v11 = 0.0;
LABEL_111:
      double v12 = 5.0;
      goto LABEL_129;
    case 58:
      v7 = @"S";
      goto LABEL_100;
    case 60:
      v7 = @"count";
      double v8 = 35.0;
      double v10 = 0.0;
      goto LABEL_86;
    case 61:
      v7 = @"count/min";
      double v8 = 60.0;
      double v10 = 0.0;
      double v11 = 6.0;
      double v12 = 26.0;
      goto LABEL_129;
    case 62:
      v7 = @"degC";
      double v10 = 33.0;
      double v8 = 42.0;
      double v11 = 35.0;
      uint64_t v13 = 0x4044000000000000;
      goto LABEL_88;
    case 71:
      v7 = @"L";
      double v10 = 0.0;
      double v8 = 8.0;
      double v11 = 1.5;
LABEL_79:
      double v12 = 7.5;
      goto LABEL_129;
    case 72:
      v7 = @"L";
      double v10 = 0.0;
      double v8 = 7.5;
      double v11 = 1.0;
      double v12 = 6.5;
      goto LABEL_129;
    case 73:
      v7 = @"L/min";
      double v10 = 50.0;
      double v8 = 1000.0;
      double v11 = 300.0;
      uint64_t v13 = 0x4089000000000000;
      goto LABEL_88;
    case 78:
      v7 = @"mg";
      double v8 = 1500.0;
      uint64_t v9 = 0x4089000000000000;
      goto LABEL_127;
    case 83:
    case 138:
LABEL_4:
      v7 = @"km";
      double v8 = 800.0;
LABEL_5:
      uint64_t v9 = 0x406E000000000000;
LABEL_127:
      double v12 = *(double *)&v9;
      goto LABEL_128;
    case 87:
      v7 = @"mL";
      double v8 = 3000.0;
LABEL_84:
      double v12 = 2000.0;
      goto LABEL_128;
    case 89:
      v7 = @"count";
      double v10 = 0.0;
      double v8 = 25.0;
LABEL_86:
      double v11 = 0.0;
      double v12 = 15.0;
      goto LABEL_129;
    case 90:
      v7 = @"degC";
      double v10 = 35.0;
      double v8 = 40.0;
      double v11 = 35.5;
      uint64_t v13 = 0x4043000000000000;
LABEL_88:
      double v12 = *(double *)&v13;
      goto LABEL_129;
    case 101:
      v7 = @"count";
      goto LABEL_100;
    case 110:
      v7 = @"m";
      goto LABEL_92;
    case 111:
      v7 = @"count";
LABEL_92:
      double v8 = 30000.0;
LABEL_93:
      double v12 = 10000.0;
      goto LABEL_128;
    case 114:
      v7 = @"cm";
      double v8 = 299.0;
      double v12 = 165.0;
      double v10 = 10.0;
      double v11 = 25.0;
      goto LABEL_129;
    case 118:
      v7 = @"count/min";
      double v8 = 299.0;
      double v11 = 45.0;
      double v12 = 120.0;
LABEL_133:
      double v10 = 10.0;
      goto LABEL_129;
    case 124:
      v7 = @"ml/(kg*min)";
      double v8 = 99.0;
      double v12 = 59.0;
      double v10 = 1.0;
LABEL_97:
      double v11 = 10.0;
      goto LABEL_129;
    case 125:
      v7 = @"IU";
      double v8 = 199.0;
      double v12 = 99.0;
      goto LABEL_128;
    case 139:
      v7 = @"ms";
LABEL_100:
      double v8 = 1.79769313e308;
      double v10 = 0.0;
      double v11 = 0.0;
      v14 = v4;
      double v12 = 1.79769313e308;
      goto LABEL_130;
    case 182:
      v7 = @"%";
      double v11 = 0.1;
      double v12 = 0.6;
      double v10 = 0.0;
      double v8 = 1.0;
      goto LABEL_129;
    case 183:
      v7 = @"m";
      double v8 = 3000.0;
LABEL_103:
      double v12 = 1000.0;
LABEL_128:
      double v10 = 0.0;
      double v11 = 0.0;
      goto LABEL_129;
    case 187:
      v7 = @"m/s";
      double v10 = 0.0;
      double v8 = 5.0;
      double v11 = 0.5;
      goto LABEL_105;
    case 188:
      v7 = @"m";
      double v11 = 0.2;
      double v12 = 1.2;
      double v10 = 0.0;
      double v8 = 2.0;
      goto LABEL_129;
    case 194:
LABEL_6:
      v7 = @"%";
      double v10 = 0.0;
      double v8 = 1.0;
      double v11 = 0.0;
LABEL_22:
      double v12 = 1.0;
      goto LABEL_129;
    case 195:
    case 196:
      v7 = @"m/s";
      double v10 = 0.0;
      double v8 = 12.0;
      double v11 = 0.0;
LABEL_105:
      double v12 = 2.0;
LABEL_129:
      v14 = v4;
LABEL_130:
      uint64_t v6 = _ValidateQuantity(v14, (uint64_t)v7, v10, v8, v11, v12);
LABEL_131:

      return v6;
    default:
      switch(v5)
      {
        case 248:
        case 249:
          goto LABEL_6;
        case 251:
          v7 = @"count";
          double v10 = 0.0;
          double v8 = 20.0;
          goto LABEL_108;
        case 258:
          v7 = @"m";
          double v10 = 0.0;
          double v8 = 6.0;
          double v11 = 0.5;
          goto LABEL_111;
        case 259:
          v7 = @"cm";
          double v10 = 0.0;
          goto LABEL_135;
        case 260:
          v7 = @"ms";
          double v8 = 500.0;
          double v11 = 50.0;
          double v12 = 450.0;
          goto LABEL_118;
        case 266:
          v7 = @"count/min";
          double v8 = 320.0;
          goto LABEL_115;
        case 269:
          v7 = @"m";
          double v8 = 275.0;
          double v12 = 36.6;
          goto LABEL_128;
        case 270:
          v7 = @"W";
          double v8 = 2000.0;
          double v11 = 60.0;
          double v12 = 1250.0;
          goto LABEL_118;
        case 274:
          v7 = @"m/s";
          double v10 = 0.0;
          double v8 = 13.0;
          double v11 = 0.0;
          double v12 = 13.0;
          goto LABEL_129;
        case 277:
          v7 = @"degC";
          double v8 = 45.0;
          double v10 = 0.0;
          double v11 = 10.0;
          goto LABEL_121;
        case 279:
          v7 = @"min";
          double v8 = 500.0;
          uint64_t v9 = 0x4049000000000000;
          goto LABEL_127;
        case 280:
          v7 = @"W";
          double v8 = 5000.0;
          double v12 = 1500.0;
          goto LABEL_128;
        case 281:
          v7 = @"m/s";
          double v8 = 100.0;
          double v10 = 0.0;
          double v11 = 0.0;
          double v12 = 22.0;
          goto LABEL_129;
        case 282:
          v7 = @"count/min";
          double v8 = 300.0;
          goto LABEL_126;
        case 283:
          v7 = @"W";
          double v8 = 1000.0;
          double v11 = 70.0;
          double v12 = 500.0;
          goto LABEL_133;
        case 286:
          v7 = @"kcal/(kg*hr)";
          double v10 = 1.0;
LABEL_135:
          double v8 = 30.0;
          double v11 = 1.0;
          double v12 = 20.0;
          goto LABEL_129;
        case 294:
        case 295:
        case 296:
        case 297:
          goto LABEL_4;
        case 298:
        case 304:
          v7 = @"appleEffortScore";
          double v10 = 1.0;
          double v8 = 20.0;
          double v11 = 1.0;
          goto LABEL_109;
        case 301:
        case 303:
          v7 = @"m/s";
          double v10 = 0.0;
          double v8 = 9.0;
          double v11 = 0.0;
          double v12 = 7.0;
          goto LABEL_129;
        case 302:
          v7 = @"m/s";
          double v10 = 0.0;
          double v8 = 30.0;
          double v11 = 0.0;
          double v12 = 25.0;
          goto LABEL_129;
        default:
          goto LABEL_131;
      }
  }
}

@end