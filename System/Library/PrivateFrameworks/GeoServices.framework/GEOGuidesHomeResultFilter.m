@interface GEOGuidesHomeResultFilter
- (GEOGuidesHomeResultFilter)initWithGuidesHomeResultFilter:(id)a3;
- (GEOGuidesHomeResultFilterTypeConcept)conceptFilter;
- (GEOPDGuidesHomeResultFilter)pdResultFilter;
- (int64_t)filterType;
@end

@implementation GEOGuidesHomeResultFilter

- (GEOGuidesHomeResultFilter)initWithGuidesHomeResultFilter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOGuidesHomeResultFilter;
  v6 = [(GEOGuidesHomeResultFilter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resultFilter, a3);
  }

  return v7;
}

- (int64_t)filterType
{
  return -[GEOPDGuidesHomeResultFilter filterType]((uint64_t)self->_resultFilter) != 0;
}

- (GEOGuidesHomeResultFilterTypeConcept)conceptFilter
{
  if (-[GEOPDGuidesHomeResultFilter filterType]((uint64_t)self->_resultFilter) == 1)
  {
    v3 = [GEOGuidesHomeResultFilterTypeConcept alloc];
    v4 = -[GEOPDGuidesHomeResultFilter filterConcept]((id *)&self->_resultFilter->super.super.isa);
    id v5 = [(GEOGuidesHomeResultFilterTypeConcept *)v3 initWithGuidesHomeResultFilterTypeConcept:v4];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _resultFilter.filterType == GEOPDGuidesHomeResultFilterType_GUIDES_HOME_RESULT_FILTER_TYPE_CONCEPT", v7, 2u);
    }
    id v5 = 0;
  }

  return v5;
}

- (GEOPDGuidesHomeResultFilter)pdResultFilter
{
  return self->_resultFilter;
}

- (void).cxx_destruct
{
}

@end