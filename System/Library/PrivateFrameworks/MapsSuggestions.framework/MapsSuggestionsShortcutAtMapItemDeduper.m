@interface MapsSuggestionsShortcutAtMapItemDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
- (MapsSuggestionsShortcutAtMapItemDeduper)initWithSacrificedTypes:(const void *)a3;
- (id).cxx_construct;
@end

@implementation MapsSuggestionsShortcutAtMapItemDeduper

- (MapsSuggestionsShortcutAtMapItemDeduper)initWithSacrificedTypes:(const void *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MapsSuggestionsShortcutAtMapItemDeduper;
  v4 = [(MapsSuggestionsShortcutAtMapItemDeduper *)&v23 init];
  v5 = v4;
  if (v4)
  {
    p_types = &v4->_types;
    if (&v4->_types != a3)
    {
      v7 = *(char **)a3;
      v8 = (char *)*((void *)a3 + 1);
      int64_t v9 = (int64_t)&v8[-*(void *)a3];
      unint64_t v10 = v9 >> 3;
      uint64_t value = (uint64_t)v4->_types.__end_cap_.__value_;
      begin = p_types->__begin_;
      if (v9 >> 3 > (unint64_t)((int64_t)(value - (unint64_t)p_types->__begin_) >> 3))
      {
        if (begin)
        {
          v4->_types.__end_ = begin;
          operator delete(begin);
          uint64_t value = 0;
          p_types->__begin_ = 0;
          p_types->__end_ = 0;
          p_types->__end_cap_.__value_ = 0;
        }
        if (v9 < 0) {
          goto LABEL_26;
        }
        uint64_t v13 = value >> 2;
        if (value >> 2 <= v10) {
          uint64_t v13 = v9 >> 3;
        }
        unint64_t v14 = (unint64_t)value >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v13;
        if (v14 >> 61) {
LABEL_26:
        }
          std::vector<MSg::_RollingWindowBudgetRule>::__throw_length_error[abi:ne180100]();
        v15 = (int64_t *)operator new(8 * v14);
        begin = v15;
        p_types->__begin_ = v15;
        p_types->__end_ = v15;
        p_types->__end_cap_.__value_ = &v15[v14];
        if (v8 != v7) {
          memcpy(v15, v7, v9);
        }
        p_end = &p_types->__end_;
        goto LABEL_24;
      }
      p_end = &v4->_types.__end_;
      end = v4->_types.__end_;
      unint64_t v18 = end - begin;
      if (v18 >= v10)
      {
        if (v8 == v7)
        {
LABEL_24:
          *p_end = (int64_t *)((char *)begin + v9);
          return v5;
        }
        v20 = begin;
        v21 = v7;
      }
      else
      {
        v19 = &v7[8 * v18];
        if (end != begin)
        {
          memmove(begin, v7, (char *)end - (char *)begin);
          begin = *p_end;
        }
        int64_t v9 = v8 - v19;
        if (v8 == v19) {
          goto LABEL_24;
        }
        v20 = begin;
        v21 = v19;
      }
      memmove(v20, v21, v9);
      goto LABEL_24;
    }
  }
  return v5;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = 0;
  return self;
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    unint64_t v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutAtMapItemDeduper.mm";
      __int16 v33 = 1024;
      int v34 = 61;
      __int16 v35 = 2082;
      v36 = "-[MapsSuggestionsShortcutAtMapItemDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v37 = 2082;
      v38 = "nil == (originalEntry)";
      v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x26u);
    }
LABEL_11:
    BOOL v9 = 0;
LABEL_12:

    goto LABEL_13;
  }
  if (!v7)
  {
    unint64_t v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutAtMapItemDeduper.mm";
      __int16 v33 = 1024;
      int v34 = 62;
      __int16 v35 = 2082;
      v36 = "-[MapsSuggestionsShortcutAtMapItemDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v37 = 2082;
      v38 = "nil == (entry)";
      v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (([v6 hasMultipleWaypointsLeft] & 1) == 0
    && ([v8 hasMultipleWaypointsLeft] & 1) == 0)
  {
    uint64_t v13 = v6;
    unint64_t v14 = v8;
    if ([v13 isShortcut]
      && (unint64_t v10 = v13, v15 = v14, ([v14 isShortcut] & 1) == 0)
      || [v14 isShortcut]
      && (unint64_t v10 = v14, v15 = v13, ![v13 isShortcut]))
    {
      p_types = &self->_types;
      begin = self->_types.__begin_;
      end = p_types->__end_;
      int64_t v20 = (char *)end - (char *)begin;
      if (end == begin)
      {
        v16 = v15;
      }
      else
      {
        if (v20 < 0) {
          std::vector<MSg::_RollingWindowBudgetRule>::__throw_length_error[abi:ne180100]();
        }
        v21 = (char *)operator new((char *)end - (char *)begin);
        uint64_t v22 = v20 >> 3;
        memmove(v21, begin, v20);
        v16 = v15;
        uint64_t v23 = 0;
        uint64_t v24 = 8 * v22;
        while (1)
        {
          uint64_t v25 = *(void *)&v21[v23];
          if (v25 == [v16 type]) {
            break;
          }
          v23 += 8;
          if (v24 == v23)
          {

            operator delete(v21);
            goto LABEL_31;
          }
        }

        operator delete(v21);
        v26 = [v13 geoMapItem];
        if (v26)
        {
          v27 = [v14 geoMapItem];

          if (v27)
          {
            v28 = [v13 geoMapItem];
            v29 = [v14 geoMapItem];
            char v30 = MapsSuggestionsMapItemsAreEqual(v28, v29, 0, 0, 0);

            if (v30)
            {
              if (v10 == v13)
              {
                BOOL v9 = 1;
                unint64_t v10 = v13;
              }
              else
              {
                [v13 replaceByEntry:v10];
                BOOL v9 = 1;
              }
              goto LABEL_32;
            }
          }
        }
      }
    }
    else
    {

      v16 = 0;
      unint64_t v10 = 0;
    }
LABEL_31:
    BOOL v9 = 0;
LABEL_32:

    goto LABEL_12;
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (void).cxx_destruct
{
  p_types = &self->_types;
  begin = self->_types.__begin_;
  if (begin)
  {
    p_types->__end_ = begin;
    operator delete(begin);
  }
}

@end