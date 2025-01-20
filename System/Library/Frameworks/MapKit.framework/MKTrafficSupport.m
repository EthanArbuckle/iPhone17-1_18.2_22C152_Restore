@interface MKTrafficSupport
+ (id)sharedTrafficSupport;
- (id)localizedRAPDescriptionForGEOIncidentType:(int)a3;
- (id)localizedReportConfirmationForIncidentType:(int)a3;
- (id)localizedReportedByYouForGEOIncidentType:(int)a3;
- (id)localizedSubtitleForStreet:(id)a3 crossStreet:(id)a4;
- (id)localizedTitleForGEOIncidentType:(int)a3 laneType:(int)a4 laneCount:(unint64_t)a5;
- (id)localizedTitleForIncidentType:(int64_t)a3 laneType:(int64_t)a4 laneCount:(unint64_t)a5;
- (int64_t)_convertType:(int)a3;
- (void)setupTrafficIncidents;
@end

@implementation MKTrafficSupport

- (void)setupTrafficIncidents
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MKTrafficSupport_setupTrafficIncidents__block_invoke;
  block[3] = &unk_1E54B8188;
  block[4] = self;
  if (setupTrafficIncidents_onceToken != -1) {
    dispatch_once(&setupTrafficIncidents_onceToken, block);
  }
}

+ (id)sharedTrafficSupport
{
  if (qword_1EB316108 != -1) {
    dispatch_once(&qword_1EB316108, &__block_literal_global_83);
  }
  v2 = (void *)_MergedGlobals_164;

  return v2;
}

void __40__MKTrafficSupport_sharedTrafficSupport__block_invoke()
{
  v0 = objc_alloc_init(MKTrafficSupport);
  v1 = (void *)_MergedGlobals_164;
  _MergedGlobals_164 = (uint64_t)v0;
}

uint64_t __41__MKTrafficSupport_setupTrafficIncidents__block_invoke()
{
  return VKTrafficIncidentSetSubtitleBlock();
}

uint64_t __41__MKTrafficSupport_setupTrafficIncidents__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) localizedTitleForIncidentType:a2 laneType:a3 laneCount:a4];
}

uint64_t __41__MKTrafficSupport_setupTrafficIncidents__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) localizedSubtitleForStreet:a2 crossStreet:a3];
}

- (int64_t)_convertType:(int)a3
{
  int64_t result = 1;
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      int64_t result = 2;
      break;
    case 2:
      int64_t result = 3;
      break;
    case 3:
      int64_t result = 4;
      break;
    case 4:
      int64_t result = 5;
      break;
    case 5:
      int64_t result = 6;
      break;
    case 6:
      int64_t result = 7;
      break;
    case 13:
      int64_t result = 13;
      break;
    case 14:
      int64_t result = 14;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (id)localizedTitleForGEOIncidentType:(int)a3 laneType:(int)a4 laneCount:(unint64_t)a5
{
  int64_t v8 = [(MKTrafficSupport *)self _convertType:*(void *)&a3];
  uint64_t v9 = (a4 - 1);
  if (v9 < 6) {
    uint64_t v10 = v9 + 1;
  }
  else {
    uint64_t v10 = 0;
  }

  return [(MKTrafficSupport *)self localizedTitleForIncidentType:v8 laneType:v10 laneCount:a5];
}

- (id)localizedTitleForIncidentType:(int64_t)a3 laneType:(int64_t)a4 laneCount:(unint64_t)a5
{
  v6 = @"Crash";
  switch(a3)
  {
    case 0:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
      v6 = @"Incident";
      goto LABEL_3;
    case 1:
      goto LABEL_3;
    case 2:
      v6 = @"Roadwork";
      goto LABEL_3;
    case 3:
      v6 = @"Road Closed";
      goto LABEL_3;
    case 4:
      v6 = @"Event";
      goto LABEL_3;
    case 5:
      v6 = @"Hazard";
      goto LABEL_3;
    case 6:
      switch(a4)
      {
        case 1:
          int64_t v8 = @"Left Lanes Closed";
          uint64_t v9 = @"Left Lane Closed";
          break;
        case 2:
          int64_t v8 = @"Center Lanes Closed";
          uint64_t v9 = @"Center Lane Closed";
          break;
        case 3:
          int64_t v8 = @"Right Lanes Closed";
          uint64_t v9 = @"Right Lane Closed";
          break;
        case 4:
          int64_t v8 = @"Shoulder Lanes Closed";
          uint64_t v9 = @"Shoulder Lane Closed";
          break;
        case 5:
          int64_t v8 = @"Carpool Lanes Closed";
          uint64_t v9 = @"Carpool Lane Closed";
          break;
        case 6:
          int64_t v8 = @"Bus Lanes Closed";
          uint64_t v9 = @"Bus Lane Closed";
          break;
        default:
          int64_t v8 = @"Lanes Closed";
          uint64_t v9 = @"Lane Closed";
          break;
      }
      if (a5 >= 2) {
        v6 = v8;
      }
      else {
        v6 = v9;
      }
      goto LABEL_3;
    case 7:
      v6 = @"Ramp Closed";
      goto LABEL_3;
    case 13:
      v6 = @"Speed Check";
LABEL_3:
      _MKLocalizedStringFromThisBundle(v6);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  return v6;
}

- (id)localizedSubtitleForStreet:(id)a3 crossStreet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    if ([v6 length])
    {
      v7 = NSString;
      int64_t v8 = _MKLocalizedStringFromThisBundle(@"%@ at %@");
      objc_msgSend(v7, "stringWithFormat:", v8, v5, v6);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = v5;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)localizedRAPDescriptionForGEOIncidentType:(int)a3
{
  unint64_t v3 = [(MKTrafficSupport *)self _convertType:*(void *)&a3];
  if (v3 <= 0xE)
  {
    v4 = _MKLocalizedStringFromThisBundle(off_1E54BCBD0[v3]);
  }

  return v4;
}

- (id)localizedReportConfirmationForIncidentType:(int)a3
{
  unint64_t v3 = [(MKTrafficSupport *)self _convertType:*(void *)&a3];
  if (v3 <= 0xE)
  {
    v4 = _MKLocalizedStringFromThisBundle(off_1E54BCC48[v3]);
  }

  return v4;
}

- (id)localizedReportedByYouForGEOIncidentType:(int)a3
{
  unint64_t v3 = [(MKTrafficSupport *)self _convertType:*(void *)&a3];
  if (v3 <= 0xE)
  {
    v4 = _MKLocalizedStringFromThisBundle(off_1E54BCCC0[v3]);
  }

  return v4;
}

@end