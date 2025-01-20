@interface BLTSectionInfoOverride
- (BLTSectionInfoOverride)initWithOverrides:(id)a3;
- (NSNumber)criticalAlert;
- (NSNumber)grouping;
- (NSNumber)level;
- (NSNumber)sound;
- (void)setCriticalAlert:(id)a3;
- (void)setGrouping:(id)a3;
- (void)setLevel:(id)a3;
- (void)setSound:(id)a3;
@end

@implementation BLTSectionInfoOverride

- (BLTSectionInfoOverride)initWithOverrides:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BLTSectionInfoOverride;
  v5 = [(BLTSectionInfoOverride *)&v27 init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2BB50]];
    if ([(id)v7 integerValue])
    {
      uint64_t level = (uint64_t)v6->_level;
      v6->_uint64_t level = (NSNumber *)&unk_26D607D20;
      goto LABEL_10;
    }
    uint64_t level = [v4 objectForKeyedSubscript:*MEMORY[0x263F2BB48]];
    if ([(id)level integerValue])
    {
      v9 = v6->_level;
      v10 = (NSNumber *)&unk_26D607D38;
    }
    else
    {
      if (!(v7 | level)) {
        goto LABEL_10;
      }
      v9 = v6->_level;
      v10 = (NSNumber *)&unk_26D607D50;
    }
    v6->_uint64_t level = v10;

LABEL_10:
    v11 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2BB30]];
    v12 = v11;
    if (!v11) {
      goto LABEL_19;
    }
    uint64_t v13 = [v11 unsignedIntegerValue];
    if (v13 == 2)
    {
      grouping = v6->_grouping;
      v15 = (NSNumber *)&unk_26D607D38;
    }
    else
    {
      if (v13 != 1)
      {
        if (v13) {
          goto LABEL_19;
        }
        grouping = v6->_grouping;
        v6->_grouping = (NSNumber *)&unk_26D607D20;
LABEL_18:

LABEL_19:
        v16 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2BB68]];
        v17 = v16;
        if (v16)
        {
          uint64_t v18 = [v16 unsignedIntegerValue];
          v19 = (NSNumber *)&unk_26D607D38;
          sound = v6->_sound;
          if (!v18) {
            v19 = (NSNumber *)&unk_26D607D50;
          }
          v6->_sound = v19;
        }
        v21 = [v4 objectForKeyedSubscript:*MEMORY[0x263F2BB38]];
        v22 = v21;
        if (v21)
        {
          uint64_t v23 = [v21 unsignedIntegerValue];
          criticalAlert = v6->_criticalAlert;
          if (v23)
          {
            v6->_criticalAlert = (NSNumber *)&unk_26D607D20;
LABEL_29:

            goto LABEL_30;
          }
          v25 = (NSNumber *)&unk_26D607D38;
        }
        else
        {
          criticalAlert = v6->_criticalAlert;
          v25 = (NSNumber *)&unk_26D607D50;
        }
        v6->_criticalAlert = v25;
        goto LABEL_29;
      }
      grouping = v6->_grouping;
      v15 = (NSNumber *)&unk_26D607D50;
    }
    v6->_grouping = v15;
    goto LABEL_18;
  }
LABEL_30:

  return v6;
}

- (NSNumber)grouping
{
  return self->_grouping;
}

- (void)setGrouping:(id)a3
{
}

- (NSNumber)level
{
  return self->_level;
}

- (void)setLevel:(id)a3
{
}

- (NSNumber)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (NSNumber)criticalAlert
{
  return self->_criticalAlert;
}

- (void)setCriticalAlert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criticalAlert, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
}

@end