@interface NSDateFormatter(MessageUIAdditions)
+ (id)ef_formatDate:()MessageUIAdditions shortStyle:;
+ (id)ef_formatDate:()MessageUIAdditions style:;
+ (id)ef_formatDate:()MessageUIAdditions style:formattingContext:;
+ (id)ef_formatterForStyle:()MessageUIAdditions;
+ (id)ef_isoDateFormatter;
@end

@implementation NSDateFormatter(MessageUIAdditions)

+ (id)ef_formatDate:()MessageUIAdditions shortStyle:
{
  id v5 = a3;
  if (a4) {
    _sharedShortDateFormatter();
  }
  else {
  v6 = _sharedLongDateFormatter();
  }
  v7 = [v6 stringFromDate:v5];

  return v7;
}

+ (id)ef_formatterForStyle:()MessageUIAdditions
{
  switch(a3)
  {
    case 0:
      _sharedShortDateFormatter();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 1:
      _sharedLongDateFormatter();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 2:
      if (_sharedMediumRelativeDateFormatter_sharedMediumRelativeDateFormatterOnceToken != -1) {
        dispatch_once(&_sharedMediumRelativeDateFormatter_sharedMediumRelativeDateFormatterOnceToken, &__block_literal_global_12);
      }
      v6 = (void *)_sharedMediumRelativeDateFormatter__sharedMediumRelativeDateFormatter;
      goto LABEL_18;
    case 3:
      if (_sharedMediumRelativeDateOnlyFormatter_sharedMediumRelativeDateOnlyFormatterOnceToken != -1) {
        dispatch_once(&_sharedMediumRelativeDateOnlyFormatter_sharedMediumRelativeDateOnlyFormatterOnceToken, &__block_literal_global_14);
      }
      v6 = (void *)_sharedMediumRelativeDateOnlyFormatter__sharedMediumRelativeDateOnlyFormatter;
      goto LABEL_18;
    case 4:
      if (_sharedShortTimeFormatter_sharedShortTimeFormatterrOnceToken != -1) {
        dispatch_once(&_sharedShortTimeFormatter_sharedShortTimeFormatterrOnceToken, &__block_literal_global_16);
      }
      v6 = (void *)_sharedShortTimeFormatter__sharedShortTimeFormatter;
      goto LABEL_18;
    case 5:
      v6 = (void *)_sharedLongTimeDateFormatter___sharedLongDateFormatter;
      if (!_sharedLongTimeDateFormatter___sharedLongDateFormatter)
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        v8 = (void *)_sharedLongTimeDateFormatter___sharedLongDateFormatter;
        _sharedLongTimeDateFormatter___sharedLongDateFormatter = (uint64_t)v7;

        [(id)_sharedLongTimeDateFormatter___sharedLongDateFormatter setTimeStyle:3];
        [(id)_sharedLongTimeDateFormatter___sharedLongDateFormatter setDateStyle:1];
        v6 = (void *)_sharedLongTimeDateFormatter___sharedLongDateFormatter;
      }
LABEL_18:
      id v4 = v6;
LABEL_19:
      break;
    default:
      id v4 = 0;
      break;
  }
  return v4;
}

+ (id)ef_isoDateFormatter
{
  if (ef_isoDateFormatter_onceToken != -1) {
    dispatch_once(&ef_isoDateFormatter_onceToken, &__block_literal_global_15);
  }
  v0 = (void *)ef_isoDateFormatter_dateFormatter;
  return v0;
}

+ (id)ef_formatDate:()MessageUIAdditions style:
{
  id v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E4F28C10], "ef_formatterForStyle:", a4);
  id v7 = [v6 stringFromDate:v5];

  return v7;
}

+ (id)ef_formatDate:()MessageUIAdditions style:formattingContext:
{
  id v7 = a3;
  v8 = objc_msgSend(MEMORY[0x1E4F28C10], "ef_formatterForStyle:", a4);
  uint64_t v9 = [v8 formattingContext];
  [v8 setFormattingContext:a5];
  v10 = [v8 stringFromDate:v7];
  [v8 setFormattingContext:v9];

  return v10;
}

@end