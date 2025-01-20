@interface GEOTooltip
- (GEOMapItemPhoto)photo;
- (GEOTooltip)initWithPDTooltip:(id)a3;
- (NSString)actionLink;
- (NSString)subtitle;
- (NSString)title;
- (int)type;
@end

@implementation GEOTooltip

- (GEOTooltip)initWithPDTooltip:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  if (v4)
  {
    v22.receiver = self;
    v22.super_class = (Class)GEOTooltip;
    v5 = [(GEOTooltip *)&v22 init];
    if (v5)
    {
      v6 = -[GEOPDTooltip title](v4);
      uint64_t v7 = [v6 stringValue];
      title = v5->_title;
      v5->_title = (NSString *)v7;

      v9 = -[GEOPDTooltip subtitle](v4);
      uint64_t v10 = [v9 stringValue];
      subtitle = v5->_subtitle;
      v5->_subtitle = (NSString *)v10;

      v12 = -[GEOPDTooltip actionLink](v4);
      uint64_t v13 = [v12 stringValue];
      actionLink = v5->_actionLink;
      v5->_actionLink = (NSString *)v13;

      v15 = [_GEOPlaceDataPhoto alloc];
      v16 = -[GEOPDTooltip photo](v4);
      uint64_t v17 = [(_GEOPlaceDataPhoto *)v15 initWithPhoto:v16];
      photo = v5->_photo;
      v5->_photo = (GEOMapItemPhoto *)v17;

      unsigned int v19 = -[GEOPDTooltip toolTipType]((uint64_t)v4);
      if (v19 >= 2)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v24 = v19;
          _os_log_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Unhandled GEOPDTooltip_TooltipType %d", buf, 8u);
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: NO", buf, 2u);
        }
        unsigned int v19 = 0;
      }
      v5->_type = v19;
    }
    self = v5;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionLink
{
  return self->_actionLink;
}

- (GEOMapItemPhoto)photo
{
  return self->_photo;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_actionLink, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end