@interface ZOTEvent
+ (id)createEventFromEventRepresentation:(id)a3;
- (AXEventRepresentation)record;
- (BOOL)chordChanged;
- (BOOL)handTouched;
- (BOOL)isTouchEventWeCareAbout;
- (id)_initWithDeviceIdentifier:(unint64_t)a3 andEventRepresentation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)handEventType;
- (void)_addFingerInformation;
- (void)setRecord:(id)a3;
@end

@implementation ZOTEvent

+ (id)createEventFromEventRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = [objc_allocWithZone((Class)ZOTEvent) _initWithDeviceIdentifier:1 andEventRepresentation:v3];

  return v4;
}

- (id)_initWithDeviceIdentifier:(unint64_t)a3 andEventRepresentation:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ZOTEvent;
  v7 = [(ZOTEvent *)&v11 initWithDeviceIdentifier:a3];
  v8 = v7;
  if (v7)
  {
    [(ZOTEvent *)v7 setRecord:v6];
    [(ZOTEvent *)v8 _addFingerInformation];
    v9 = v8;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[AXEventRepresentation copyWithZone:](self->_record, "copyWithZone:");
  id v6 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithDeviceIdentifier:andEventRepresentation:", -[ZOTEvent deviceIdentifier](self, "deviceIdentifier"), v5);

  return v6;
}

- (void)_addFingerInformation
{
  if ([(AXEventRepresentation *)self->_record type] != 3001) {
    return;
  }
  id v3 = [(AXEventRepresentation *)self->_record handInfo];
  unsigned int v4 = [v3 eventType];
  unsigned int v5 = v4;
  self->_chordChanged = v4 == 5;
  self->_handTouched = v4 == 1;
  if (v4 == 1)
  {
    p_weCare = &self->_weCare;
    self->_weCare = 1;
  }
  else
  {
    unsigned int v7 = (0x744u >> v4) & 1;
    if (v4 > 0xA) {
      LOBYTE(v7) = 0;
    }
    if (self->_chordChanged) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v7;
    }
    p_weCare = &self->_weCare;
    self->_weCare = v8;
    int v9 = 1;
    if (v4 <= 0xA && ((1 << v4) & 0x640) != 0) {
      goto LABEL_15;
    }
  }
  int v9 = 0;
LABEL_15:
  unsigned int v11 = [v3 isStylus];
  if (*p_weCare)
  {
    unsigned int v12 = v5 == 9 ? v11 : 0;
    int v13 = v5 == 8 ? 1 : v9;
    if (v13 != 1 || v12 != 0)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v15 = objc_msgSend(v3, "paths", 0);
      id v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v33;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (([v20 pathProximity] & 2) != 0)
            {
              unsigned int v21 = [v20 transducerType];
              uint64_t v22 = [v20 pathIndex];
              [v20 pathLocation];
              double v24 = v23;
              double v26 = v25;
              [v20 orbValue];
              double v28 = v27;
              if (v21)
              {
                -[ZOTEvent addFingerWithIdentifier:location:pressure:](self, "addFingerWithIdentifier:location:pressure:", v22, v24, v26, v28);
              }
              else
              {
                [v20 altitude];
                double v30 = v29;
                [v20 azimuth];
                -[ZOTEvent addStylusWithIdentifier:location:pressure:altitude:azimuth:](self, "addStylusWithIdentifier:location:pressure:altitude:azimuth:", v22, v24, v26, v28, v30, v31);
              }
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v17);
      }
    }
  }
}

- (id)description
{
  return +[NSString stringWithFormat:@"[%p] event type: %d - event rep: %@", self, [(AXEventRepresentation *)self->_record type], self->_record];
}

- (BOOL)chordChanged
{
  return self->_chordChanged;
}

- (unsigned)handEventType
{
  v2 = [(AXEventRepresentation *)self->_record handInfo];
  unsigned int v3 = [v2 eventType];

  return v3;
}

- (BOOL)handTouched
{
  return self->_handTouched;
}

- (BOOL)isTouchEventWeCareAbout
{
  return self->_weCare;
}

- (AXEventRepresentation)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end