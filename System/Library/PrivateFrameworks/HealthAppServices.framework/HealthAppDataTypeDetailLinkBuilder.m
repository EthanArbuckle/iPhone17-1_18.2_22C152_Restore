@interface HealthAppDataTypeDetailLinkBuilder
- (id)URLForDataTypeDetailWithObjectType:(id)a3;
- (id)URLForDataTypeDetailWithObjectType:(id)a3 date:(id)a4;
- (id)URLForDataTypeDetailWithObjectType:(id)a3 date:(id)a4 trendOverlay:(int64_t)a5;
- (id)URLForDataTypeDetailWithObjectType:(id)a3 dateInterval:(id)a4;
- (id)URLForDataTypeDetailWithObjectType:(id)a3 dateInterval:(id)a4 trendOverlay:(int64_t)a5;
- (id)URLForDataTypeDetailWithObjectType:(id)a3 trendOverlay:(int64_t)a4;
- (id)baseURLComponentsWithObjectType:(id)a3 trendOverlay:(int64_t)a4;
- (id)baseURLForObjectType:(id)a3;
- (id)standardBaseURLForObjectType:(id)a3;
@end

@implementation HealthAppDataTypeDetailLinkBuilder

- (id)URLForDataTypeDetailWithObjectType:(id)a3
{
  return [(HealthAppDataTypeDetailLinkBuilder *)self URLForDataTypeDetailWithObjectType:a3 trendOverlay:0];
}

- (id)URLForDataTypeDetailWithObjectType:(id)a3 trendOverlay:(int64_t)a4
{
  v5 = [(HealthAppDataTypeDetailLinkBuilder *)self baseURLComponentsWithObjectType:a3 trendOverlay:a4];
  v6 = [v5 URL];
  v7 = [(HealthAppLinkBuilder *)self profileIdentifier];
  v8 = objc_msgSend(v6, "_hk_appendProfileIdentifier:", v7);

  return v8;
}

- (id)URLForDataTypeDetailWithObjectType:(id)a3 date:(id)a4
{
  return [(HealthAppDataTypeDetailLinkBuilder *)self URLForDataTypeDetailWithObjectType:a3 date:a4 trendOverlay:0];
}

- (id)URLForDataTypeDetailWithObjectType:(id)a3 date:(id)a4 trendOverlay:(int64_t)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [(HealthAppDataTypeDetailLinkBuilder *)self baseURLComponentsWithObjectType:a3 trendOverlay:a5];
  v10 = [v9 queryItems];
  v11 = (void *)[v10 mutableCopy];
  v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v14 = v13;

  v15 = NSNumber;
  [v8 timeIntervalSinceReferenceDate];
  double v17 = v16;

  v18 = [v15 numberWithInteger:(uint64_t)v17];
  v19 = (void *)MEMORY[0x1E4F290C8];
  v20 = +[HAServicesDefines queryParameterNameDate];
  v21 = [v18 stringValue];
  v22 = [v19 queryItemWithName:v20 value:v21];
  v28[0] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [v14 addObjectsFromArray:v23];

  [v9 setQueryItems:v14];
  v24 = [v9 URL];
  v25 = [(HealthAppLinkBuilder *)self profileIdentifier];
  v26 = objc_msgSend(v24, "_hk_appendProfileIdentifier:", v25);

  return v26;
}

- (id)URLForDataTypeDetailWithObjectType:(id)a3 dateInterval:(id)a4
{
  return [(HealthAppDataTypeDetailLinkBuilder *)self URLForDataTypeDetailWithObjectType:a3 dateInterval:a4 trendOverlay:0];
}

- (id)URLForDataTypeDetailWithObjectType:(id)a3 dateInterval:(id)a4 trendOverlay:(int64_t)a5
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v36 = self;
  v9 = [(HealthAppDataTypeDetailLinkBuilder *)self baseURLComponentsWithObjectType:a3 trendOverlay:a5];
  v10 = [v9 queryItems];
  v11 = (void *)[v10 mutableCopy];
  v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v14 = v13;

  v15 = NSNumber;
  double v16 = [v8 startDate];
  [v16 timeIntervalSinceReferenceDate];
  v35 = [v15 numberWithInteger:(uint64_t)v17];

  v18 = NSNumber;
  v19 = [v8 endDate];

  [v19 timeIntervalSinceReferenceDate];
  v21 = [v18 numberWithInteger:(uint64_t)v20];

  v22 = (void *)MEMORY[0x1E4F290C8];
  v23 = +[HAServicesDefines queryParameterNameStartDate];
  v24 = [v35 stringValue];
  v25 = [v22 queryItemWithName:v23 value:v24];
  v37[0] = v25;
  v26 = (void *)MEMORY[0x1E4F290C8];
  v27 = +[HAServicesDefines queryParameterNameEndDate];
  v28 = [v21 stringValue];
  v29 = [v26 queryItemWithName:v27 value:v28];
  v37[1] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  [v14 addObjectsFromArray:v30];

  [v9 setQueryItems:v14];
  v31 = [v9 URL];
  v32 = [(HealthAppLinkBuilder *)v36 profileIdentifier];
  v33 = objc_msgSend(v31, "_hk_appendProfileIdentifier:", v32);

  return v33;
}

- (id)baseURLComponentsWithObjectType:(id)a3 trendOverlay:(int64_t)a4
{
  v6 = [(HealthAppDataTypeDetailLinkBuilder *)self baseURLForObjectType:a3];
  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v6 resolvingAgainstBaseURL:0];
    id v8 = [v7 queryItems];
    v9 = (void *)[v8 mutableCopy];
    v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    v12 = v11;

    if (a4)
    {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%d", a4);
      v14 = (void *)MEMORY[0x1E4F290C8];
      v15 = +[HAServicesDefines queryParameterNameTrendOverlay];
      double v16 = [v14 queryItemWithName:v15 value:v13];
      [v12 addObject:v16];
    }
    uint64_t v17 = [(HealthAppLinkBuilder *)self source];
    if (v17)
    {
      v18 = (void *)v17;
      v19 = [(HealthAppLinkBuilder *)self source];
      uint64_t v20 = [v19 length];

      if (v20)
      {
        v21 = (void *)MEMORY[0x1E4F290C8];
        v22 = +[HAServicesDefines queryParameterNameSource];
        v23 = [(HealthAppLinkBuilder *)self source];
        v24 = [v21 queryItemWithName:v22 value:v23];
        [v12 addObject:v24];
      }
    }
    if ([v12 count]) {
      [v7 setQueryItems:v12];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)standardBaseURLForObjectType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
  v6 = [v5 queryItems];
  v7 = (void *)[v6 mutableCopy];
  id v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v10 = v9;

  if ([(HealthAppLinkBuilder *)self useExternalURLScheme])
  {
    id v11 = +[HAServicesDefines externalHealthAppURLScheme];
    [v5 setScheme:v11];

    v12 = +[HAServicesDefines externalHealthAppURLHost];
    [v5 setHost:v12];
  }
  else
  {
    v12 = +[HAServicesDefines internalHealthAppURLScheme];
    [v5 setScheme:v12];
  }

  id v13 = [(HealthAppLinkBuilder *)self profileIdentifier];
  uint64_t v14 = [v13 type];

  if ((unint64_t)(v14 - 2) >= 2)
  {
    if (v14 != 1)
    {
      v23 = 0;
      goto LABEL_20;
    }
    if (![(HealthAppLinkBuilder *)self useExternalURLScheme])
    {
      v25 = +[HAServicesDefines sampleTypeHostName];
      [v5 setHost:v25];

      v26 = NSString;
      v19 = [v4 identifier];
      uint64_t v20 = [v26 stringWithFormat:@"/%@", v19];
      [v5 setPath:v20];
      goto LABEL_16;
    }
    v18 = NSString;
    v19 = +[HAServicesDefines sampleTypeHostName];
    uint64_t v20 = [v4 identifier];
    v21 = [v18 stringWithFormat:@"/%@/%@", v19, v20];
    [v5 setPath:v21];
  }
  else
  {
    if ([(HealthAppLinkBuilder *)self useExternalURLScheme])
    {
      v15 = NSString;
      double v16 = +[HAServicesDefines dataTypeDetailHostName];
      uint64_t v17 = [v15 stringWithFormat:@"/%@", v16];
      [v5 setPath:v17];
    }
    else
    {
      double v16 = +[HAServicesDefines dataTypeDetailHostName];
      [v5 setHost:v16];
    }

    v19 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v4, "code"));
    v22 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v20 = +[HAServicesDefines queryParameterNameDataTypeCode];
    v21 = [v22 queryItemWithName:v20 value:v19];
    [v10 addObject:v21];
  }

LABEL_16:
  if ([v10 count]) {
    [v5 setQueryItems:v10];
  }
  v23 = [v5 URL];
LABEL_20:

  return v23;
}

- (id)baseURLForObjectType:(id)a3
{
  id v4 = a3;
  id v5 = 0;
  switch([v4 code])
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 14:
    case 15:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 61:
    case 62:
    case 63:
    case 70:
    case 71:
    case 72:
    case 73:
    case 75:
    case 78:
    case 79:
    case 80:
    case 83:
    case 87:
    case 89:
    case 90:
    case 91:
    case 92:
    case 95:
    case 96:
    case 97:
    case 99:
    case 100:
    case 101:
    case 110:
    case 111:
    case 113:
    case 114:
    case 118:
    case 124:
    case 125:
    case 137:
    case 138:
    case 139:
    case 140:
    case 144:
    case 145:
    case 147:
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
    case 178:
    case 179:
    case 182:
    case 183:
    case 186:
    case 187:
    case 188:
    case 189:
    case 191:
    case 192:
    case 193:
    case 194:
    case 195:
    case 196:
    case 199:
    case 201:
    case 202:
    case 203:
    case 204:
    case 205:
    case 206:
    case 207:
    case 220:
    case 221:
    case 222:
    case 223:
    case 224:
    case 225:
    case 226:
    case 229:
    case 230:
    case 231:
    case 232:
    case 233:
    case 234:
    case 235:
    case 236:
    case 237:
    case 240:
    case 241:
    case 242:
    case 243:
    case 244:
    case 248:
    case 249:
    case 250:
    case 251:
    case 256:
    case 257:
    case 258:
    case 259:
    case 260:
    case 262:
    case 263:
    case 264:
    case 265:
    case 266:
    case 269:
    case 270:
    case 272:
    case 274:
    case 275:
    case 276:
    case 277:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 284:
    case 286:
    case 287:
    case 288:
    case 294:
    case 295:
    case 296:
    case 297:
    case 301:
    case 302:
    case 303:
    case 305:
    case 313:
    case 314:
      id v5 = [(HealthAppDataTypeDetailLinkBuilder *)self standardBaseURLForObjectType:v4];
      break;
    default:
      break;
  }

  return v5;
}

@end