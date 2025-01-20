@interface GEOPublisherViewResultFilter
- (GEOPublisherViewResultFilter)initWithPublisherViewResultFilter:(id)a3 withPlaces:(id)a4;
- (GEOPublisherViewResultFilterAddress)addressFilter;
- (GEOPublisherViewResultFilterKeyword)keywordFilter;
- (int64_t)filterType;
@end

@implementation GEOPublisherViewResultFilter

- (GEOPublisherViewResultFilter)initWithPublisherViewResultFilter:(id)a3 withPlaces:(id)a4
{
  v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GEOPublisherViewResultFilter;
  v9 = [(GEOPublisherViewResultFilter *)&v12 init];
  v10 = v9;
  if (v7)
  {
    if (v9)
    {
      -[GEOPDPublisherViewResultFilter _readFilterAddress]((uint64_t)v7);
      if (*((void *)v7 + 3)
        || (-[GEOPDPublisherViewResultFilter _readFilterKeyword]((uint64_t)v7), *((void *)v7 + 4)))
      {
        if (v7[56])
        {
          objc_storeStrong((id *)&v10->_resultFilter, a3);
          objc_storeStrong((id *)&v10->_places, a4);
        }
      }
    }
  }

  return v10;
}

- (int64_t)filterType
{
  int v2 = -[GEOPDPublisherViewResultFilter filterType]((uint64_t)self->_resultFilter);
  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (GEOPublisherViewResultFilterAddress)addressFilter
{
  if (-[GEOPDPublisherViewResultFilter filterType]((uint64_t)self->_resultFilter) == 1)
  {
    v3 = [GEOPublisherViewResultFilterAddress alloc];
    v4 = -[GEOPDPublisherViewResultFilter filterAddress]((id *)&self->_resultFilter->super.super.isa);
    v5 = [(GEOPublisherViewResultFilterAddress *)v3 initWithFilterAddressIdentifier:v4 withPlaces:self->_places];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _resultFilter.filterType == GEOPDPublisherViewResultFilterType_PUBLISHER_VIEW_RESULT_FILTER_TYPE_ADDRESS", v7, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (GEOPublisherViewResultFilterKeyword)keywordFilter
{
  if (-[GEOPDPublisherViewResultFilter filterType]((uint64_t)self->_resultFilter) == 2)
  {
    v3 = [GEOPublisherViewResultFilterKeyword alloc];
    v4 = -[GEOPDPublisherViewResultFilter filterKeyword]((id *)&self->_resultFilter->super.super.isa);
    v5 = [(GEOPublisherViewResultFilterKeyword *)v3 initWithFilterKeywordIdentifier:v4];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _resultFilter.filterType == GEOPDPublisherViewResultFilterType_PUBLISHER_VIEW_RESULT_FILTER_TYPE_KEYWORD", v7, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_places, 0);

  objc_storeStrong((id *)&self->_resultFilter, 0);
}

@end