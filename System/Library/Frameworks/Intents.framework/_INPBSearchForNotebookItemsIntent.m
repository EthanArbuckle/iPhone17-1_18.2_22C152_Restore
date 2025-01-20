@interface _INPBSearchForNotebookItemsIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasContent;
- (BOOL)hasDateSearchType;
- (BOOL)hasDateTime;
- (BOOL)hasGroupName;
- (BOOL)hasIncludeAllNoteContents;
- (BOOL)hasIntentMetadata;
- (BOOL)hasItemType;
- (BOOL)hasLocation;
- (BOOL)hasLocationSearchType;
- (BOOL)hasNotebookItemIdentifier;
- (BOOL)hasStatus;
- (BOOL)hasTaskPriority;
- (BOOL)hasTitle;
- (BOOL)includeAllNoteContents;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)content;
- (NSString)notebookItemIdentifier;
- (_INPBDataString)groupName;
- (_INPBDataString)title;
- (_INPBDateTimeRange)dateTime;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBLocation)location;
- (_INPBSearchForNotebookItemsIntent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateSearchTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)itemTypeAsString:(int)a3;
- (id)locationSearchTypeAsString:(int)a3;
- (id)statusAsString:(int)a3;
- (id)taskPriorityAsString:(int)a3;
- (id)temporalEventTriggerTypesAsString:(int)a3;
- (int)StringAsDateSearchType:(id)a3;
- (int)StringAsItemType:(id)a3;
- (int)StringAsLocationSearchType:(id)a3;
- (int)StringAsStatus:(id)a3;
- (int)StringAsTaskPriority:(id)a3;
- (int)StringAsTemporalEventTriggerTypes:(id)a3;
- (int)dateSearchType;
- (int)itemType;
- (int)locationSearchType;
- (int)status;
- (int)taskPriority;
- (int)temporalEventTriggerTypeAtIndex:(unint64_t)a3;
- (int)temporalEventTriggerTypes;
- (unint64_t)hash;
- (unint64_t)temporalEventTriggerTypesCount;
- (void)addTemporalEventTriggerType:(int)a3;
- (void)clearTemporalEventTriggerTypes;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setDateSearchType:(int)a3;
- (void)setDateTime:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setHasDateSearchType:(BOOL)a3;
- (void)setHasIncludeAllNoteContents:(BOOL)a3;
- (void)setHasItemType:(BOOL)a3;
- (void)setHasLocationSearchType:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTaskPriority:(BOOL)a3;
- (void)setIncludeAllNoteContents:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setItemType:(int)a3;
- (void)setLocation:(id)a3;
- (void)setLocationSearchType:(int)a3;
- (void)setNotebookItemIdentifier:(id)a3;
- (void)setStatus:(int)a3;
- (void)setTaskPriority:(int)a3;
- (void)setTemporalEventTriggerTypes:(int *)a3 count:(unint64_t)a4;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSearchForNotebookItemsIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_notebookItemIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_dateTime, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

- (_INPBDataString)title
{
  return self->_title;
}

- (int)taskPriority
{
  return self->_taskPriority;
}

- (int)status
{
  return self->_status;
}

- (NSString)notebookItemIdentifier
{
  return self->_notebookItemIdentifier;
}

- (int)locationSearchType
{
  return self->_locationSearchType;
}

- (_INPBLocation)location
{
  return self->_location;
}

- (int)itemType
{
  return self->_itemType;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)includeAllNoteContents
{
  return self->_includeAllNoteContents;
}

- (_INPBDataString)groupName
{
  return self->_groupName;
}

- (_INPBDateTimeRange)dateTime
{
  return self->_dateTime;
}

- (int)dateSearchType
{
  return self->_dateSearchType;
}

- (NSString)content
{
  return self->_content;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_content)
  {
    v4 = [(_INPBSearchForNotebookItemsIntent *)self content];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"content"];
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasDateSearchType])
  {
    uint64_t v6 = [(_INPBSearchForNotebookItemsIntent *)self dateSearchType];
    if ((int)v6 > 19)
    {
      if (v6 == 20)
      {
        v7 = @"BY_MODIFIED_DATE";
        goto LABEL_14;
      }
      if (v6 == 30)
      {
        v7 = @"BY_CREATED_DATE";
        goto LABEL_14;
      }
    }
    else
    {
      if (!v6)
      {
        v7 = @"UNKNOWN_DATE_SEARCH_TYPE";
        goto LABEL_14;
      }
      if (v6 == 10)
      {
        v7 = @"BY_DUE_DATE";
LABEL_14:
        [v3 setObject:v7 forKeyedSubscript:@"dateSearchType"];

        goto LABEL_15;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_15:
  v8 = [(_INPBSearchForNotebookItemsIntent *)self dateTime];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"dateTime"];

  v10 = [(_INPBSearchForNotebookItemsIntent *)self groupName];
  v11 = [v10 dictionaryRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"groupName"];

  if ([(_INPBSearchForNotebookItemsIntent *)self hasIncludeAllNoteContents])
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBSearchForNotebookItemsIntent includeAllNoteContents](self, "includeAllNoteContents"));
    [v3 setObject:v12 forKeyedSubscript:@"includeAllNoteContents"];
  }
  v13 = [(_INPBSearchForNotebookItemsIntent *)self intentMetadata];
  v14 = [v13 dictionaryRepresentation];
  [v3 setObject:v14 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBSearchForNotebookItemsIntent *)self hasItemType])
  {
    uint64_t v15 = [(_INPBSearchForNotebookItemsIntent *)self itemType];
    if ((int)v15 > 19)
    {
      if (v15 == 20)
      {
        v16 = @"TASK_LIST";
        goto LABEL_28;
      }
      if (v15 == 30)
      {
        v16 = @"TASK";
        goto LABEL_28;
      }
    }
    else
    {
      if (!v15)
      {
        v16 = @"UNKNOWN_NOTE_TYPE";
        goto LABEL_28;
      }
      if (v15 == 10)
      {
        v16 = @"NOTE";
LABEL_28:
        [v3 setObject:v16 forKeyedSubscript:@"itemType"];

        goto LABEL_29;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
LABEL_29:
  v17 = [(_INPBSearchForNotebookItemsIntent *)self location];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"location"];

  if ([(_INPBSearchForNotebookItemsIntent *)self hasLocationSearchType])
  {
    uint64_t v19 = [(_INPBSearchForNotebookItemsIntent *)self locationSearchType];
    if (v19)
    {
      if (v19 == 10)
      {
        v20 = @"BY_LOCATION_TRIGGER";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v19);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v20 = @"UNKNOWN_LOCATION_SEARCH_TYPE";
    }
    [v3 setObject:v20 forKeyedSubscript:@"locationSearchType"];
  }
  if (self->_notebookItemIdentifier)
  {
    v21 = [(_INPBSearchForNotebookItemsIntent *)self notebookItemIdentifier];
    v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"notebookItemIdentifier"];
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasStatus])
  {
    uint64_t v23 = [(_INPBSearchForNotebookItemsIntent *)self status];
    if (v23)
    {
      if (v23 == 20)
      {
        v24 = @"COMPLETED";
      }
      else if (v23 == 10)
      {
        v24 = @"NOT_COMPLETED";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v23);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v24 = @"UNKNOWN_STATUS";
    }
    [v3 setObject:v24 forKeyedSubscript:@"status"];
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasTaskPriority])
  {
    uint64_t v25 = [(_INPBSearchForNotebookItemsIntent *)self taskPriority];
    if (v25 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v25);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E551BE80[v25];
    }
    [v3 setObject:v26 forKeyedSubscript:@"taskPriority"];
  }
  if (self->_temporalEventTriggerTypes.count)
  {
    v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBSearchForNotebookItemsIntent temporalEventTriggerTypesCount](self, "temporalEventTriggerTypesCount"));
    if ([(_INPBSearchForNotebookItemsIntent *)self temporalEventTriggerTypesCount])
    {
      unint64_t v28 = 0;
      do
      {
        uint64_t v29 = self->_temporalEventTriggerTypes.list[v28];
        if (v29 >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_temporalEventTriggerTypes.list[v28]);
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = off_1E551BE98[v29];
        }
        [v27 addObject:v30];

        ++v28;
      }
      while (v28 < [(_INPBSearchForNotebookItemsIntent *)self temporalEventTriggerTypesCount]);
    }
    [v3 setObject:v27 forKeyedSubscript:@"temporalEventTriggerType"];
  }
  v31 = [(_INPBSearchForNotebookItemsIntent *)self title];
  v32 = [v31 dictionaryRepresentation];
  [v3 setObject:v32 forKeyedSubscript:@"title"];

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v16 = [(NSString *)self->_content hash];
  if ([(_INPBSearchForNotebookItemsIntent *)self hasDateSearchType]) {
    uint64_t v15 = 2654435761 * self->_dateSearchType;
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v14 = [(_INPBDateTimeRange *)self->_dateTime hash];
  unint64_t v3 = [(_INPBDataString *)self->_groupName hash];
  if ([(_INPBSearchForNotebookItemsIntent *)self hasIncludeAllNoteContents]) {
    uint64_t v4 = 2654435761 * self->_includeAllNoteContents;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBSearchForNotebookItemsIntent *)self hasItemType]) {
    uint64_t v6 = 2654435761 * self->_itemType;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(_INPBLocation *)self->_location hash];
  if ([(_INPBSearchForNotebookItemsIntent *)self hasLocationSearchType]) {
    uint64_t v8 = 2654435761 * self->_locationSearchType;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_notebookItemIdentifier hash];
  if ([(_INPBSearchForNotebookItemsIntent *)self hasStatus]) {
    uint64_t v10 = 2654435761 * self->_status;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasTaskPriority]) {
    uint64_t v11 = 2654435761 * self->_taskPriority;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v11 ^ PBRepeatedInt32Hash();
  return v15 ^ v16 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ [(_INPBDataString *)self->_title hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  unint64_t v5 = [(_INPBSearchForNotebookItemsIntent *)self content];
  uint64_t v6 = [v4 content];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v7 = [(_INPBSearchForNotebookItemsIntent *)self content];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_INPBSearchForNotebookItemsIntent *)self content];
    uint64_t v10 = [v4 content];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  int v12 = [(_INPBSearchForNotebookItemsIntent *)self hasDateSearchType];
  if (v12 != [v4 hasDateSearchType]) {
    goto LABEL_62;
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasDateSearchType])
  {
    if ([v4 hasDateSearchType])
    {
      int dateSearchType = self->_dateSearchType;
      if (dateSearchType != [v4 dateSearchType]) {
        goto LABEL_62;
      }
    }
  }
  unint64_t v5 = [(_INPBSearchForNotebookItemsIntent *)self dateTime];
  uint64_t v6 = [v4 dateTime];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v14 = [(_INPBSearchForNotebookItemsIntent *)self dateTime];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    NSUInteger v16 = [(_INPBSearchForNotebookItemsIntent *)self dateTime];
    v17 = [v4 dateTime];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSearchForNotebookItemsIntent *)self groupName];
  uint64_t v6 = [v4 groupName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v19 = [(_INPBSearchForNotebookItemsIntent *)self groupName];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(_INPBSearchForNotebookItemsIntent *)self groupName];
    v22 = [v4 groupName];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  int v24 = [(_INPBSearchForNotebookItemsIntent *)self hasIncludeAllNoteContents];
  if (v24 != [v4 hasIncludeAllNoteContents]) {
    goto LABEL_62;
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasIncludeAllNoteContents])
  {
    if ([v4 hasIncludeAllNoteContents])
    {
      int includeAllNoteContents = self->_includeAllNoteContents;
      if (includeAllNoteContents != [v4 includeAllNoteContents]) {
        goto LABEL_62;
      }
    }
  }
  unint64_t v5 = [(_INPBSearchForNotebookItemsIntent *)self intentMetadata];
  uint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v26 = [(_INPBSearchForNotebookItemsIntent *)self intentMetadata];
  if (v26)
  {
    v27 = (void *)v26;
    unint64_t v28 = [(_INPBSearchForNotebookItemsIntent *)self intentMetadata];
    uint64_t v29 = [v4 intentMetadata];
    int v30 = [v28 isEqual:v29];

    if (!v30) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  int v31 = [(_INPBSearchForNotebookItemsIntent *)self hasItemType];
  if (v31 != [v4 hasItemType]) {
    goto LABEL_62;
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasItemType])
  {
    if ([v4 hasItemType])
    {
      int itemType = self->_itemType;
      if (itemType != [v4 itemType]) {
        goto LABEL_62;
      }
    }
  }
  unint64_t v5 = [(_INPBSearchForNotebookItemsIntent *)self location];
  uint64_t v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v33 = [(_INPBSearchForNotebookItemsIntent *)self location];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(_INPBSearchForNotebookItemsIntent *)self location];
    v36 = [v4 location];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  int v38 = [(_INPBSearchForNotebookItemsIntent *)self hasLocationSearchType];
  if (v38 != [v4 hasLocationSearchType]) {
    goto LABEL_62;
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasLocationSearchType])
  {
    if ([v4 hasLocationSearchType])
    {
      int locationSearchType = self->_locationSearchType;
      if (locationSearchType != [v4 locationSearchType]) {
        goto LABEL_62;
      }
    }
  }
  unint64_t v5 = [(_INPBSearchForNotebookItemsIntent *)self notebookItemIdentifier];
  uint64_t v6 = [v4 notebookItemIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_61;
  }
  uint64_t v40 = [(_INPBSearchForNotebookItemsIntent *)self notebookItemIdentifier];
  if (v40)
  {
    v41 = (void *)v40;
    v42 = [(_INPBSearchForNotebookItemsIntent *)self notebookItemIdentifier];
    v43 = [v4 notebookItemIdentifier];
    int v44 = [v42 isEqual:v43];

    if (!v44) {
      goto LABEL_62;
    }
  }
  else
  {
  }
  int v45 = [(_INPBSearchForNotebookItemsIntent *)self hasStatus];
  if (v45 != [v4 hasStatus]) {
    goto LABEL_62;
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasStatus])
  {
    if ([v4 hasStatus])
    {
      int status = self->_status;
      if (status != [v4 status]) {
        goto LABEL_62;
      }
    }
  }
  int v47 = [(_INPBSearchForNotebookItemsIntent *)self hasTaskPriority];
  if (v47 != [v4 hasTaskPriority]) {
    goto LABEL_62;
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasTaskPriority])
  {
    if ([v4 hasTaskPriority])
    {
      int taskPriority = self->_taskPriority;
      if (taskPriority != [v4 taskPriority]) {
        goto LABEL_62;
      }
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_62;
  }
  unint64_t v5 = [(_INPBSearchForNotebookItemsIntent *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v49 = [(_INPBSearchForNotebookItemsIntent *)self title];
    if (!v49)
    {

LABEL_65:
      BOOL v54 = 1;
      goto LABEL_63;
    }
    v50 = (void *)v49;
    v51 = [(_INPBSearchForNotebookItemsIntent *)self title];
    v52 = [v4 title];
    char v53 = [v51 isEqual:v52];

    if (v53) {
      goto LABEL_65;
    }
  }
  else
  {
LABEL_61:
  }
LABEL_62:
  BOOL v54 = 0;
LABEL_63:

  return v54;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSearchForNotebookItemsIntent allocWithZone:](_INPBSearchForNotebookItemsIntent, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSString *)self->_content copyWithZone:a3];
  [(_INPBSearchForNotebookItemsIntent *)v5 setContent:v6];

  if ([(_INPBSearchForNotebookItemsIntent *)self hasDateSearchType]) {
    [(_INPBSearchForNotebookItemsIntent *)v5 setDateSearchType:[(_INPBSearchForNotebookItemsIntent *)self dateSearchType]];
  }
  id v7 = [(_INPBDateTimeRange *)self->_dateTime copyWithZone:a3];
  [(_INPBSearchForNotebookItemsIntent *)v5 setDateTime:v7];

  id v8 = [(_INPBDataString *)self->_groupName copyWithZone:a3];
  [(_INPBSearchForNotebookItemsIntent *)v5 setGroupName:v8];

  if ([(_INPBSearchForNotebookItemsIntent *)self hasIncludeAllNoteContents]) {
    [(_INPBSearchForNotebookItemsIntent *)v5 setIncludeAllNoteContents:[(_INPBSearchForNotebookItemsIntent *)self includeAllNoteContents]];
  }
  id v9 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSearchForNotebookItemsIntent *)v5 setIntentMetadata:v9];

  if ([(_INPBSearchForNotebookItemsIntent *)self hasItemType]) {
    [(_INPBSearchForNotebookItemsIntent *)v5 setItemType:[(_INPBSearchForNotebookItemsIntent *)self itemType]];
  }
  id v10 = [(_INPBLocation *)self->_location copyWithZone:a3];
  [(_INPBSearchForNotebookItemsIntent *)v5 setLocation:v10];

  if ([(_INPBSearchForNotebookItemsIntent *)self hasLocationSearchType]) {
    [(_INPBSearchForNotebookItemsIntent *)v5 setLocationSearchType:[(_INPBSearchForNotebookItemsIntent *)self locationSearchType]];
  }
  int v11 = (void *)[(NSString *)self->_notebookItemIdentifier copyWithZone:a3];
  [(_INPBSearchForNotebookItemsIntent *)v5 setNotebookItemIdentifier:v11];

  if ([(_INPBSearchForNotebookItemsIntent *)self hasStatus]) {
    [(_INPBSearchForNotebookItemsIntent *)v5 setStatus:[(_INPBSearchForNotebookItemsIntent *)self status]];
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasTaskPriority]) {
    [(_INPBSearchForNotebookItemsIntent *)v5 setTaskPriority:[(_INPBSearchForNotebookItemsIntent *)self taskPriority]];
  }
  PBRepeatedInt32Copy();
  id v12 = [(_INPBDataString *)self->_title copyWithZone:a3];
  [(_INPBSearchForNotebookItemsIntent *)v5 setTitle:v12];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSearchForNotebookItemsIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSearchForNotebookItemsIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSearchForNotebookItemsIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSearchForNotebookItemsIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSearchForNotebookItemsIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBSearchForNotebookItemsIntent *)self clearTemporalEventTriggerTypes];
  v3.receiver = self;
  v3.super_class = (Class)_INPBSearchForNotebookItemsIntent;
  [(_INPBSearchForNotebookItemsIntent *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v17 = a3;
  id v4 = [(_INPBSearchForNotebookItemsIntent *)self content];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasDateSearchType]) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v5 = [(_INPBSearchForNotebookItemsIntent *)self dateTime];

  if (v5)
  {
    id v6 = [(_INPBSearchForNotebookItemsIntent *)self dateTime];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBSearchForNotebookItemsIntent *)self groupName];

  if (v7)
  {
    id v8 = [(_INPBSearchForNotebookItemsIntent *)self groupName];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasIncludeAllNoteContents]) {
    PBDataWriterWriteBOOLField();
  }
  id v9 = [(_INPBSearchForNotebookItemsIntent *)self intentMetadata];

  if (v9)
  {
    id v10 = [(_INPBSearchForNotebookItemsIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasItemType]) {
    PBDataWriterWriteInt32Field();
  }
  int v11 = [(_INPBSearchForNotebookItemsIntent *)self location];

  if (v11)
  {
    id v12 = [(_INPBSearchForNotebookItemsIntent *)self location];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasLocationSearchType]) {
    PBDataWriterWriteInt32Field();
  }
  v13 = [(_INPBSearchForNotebookItemsIntent *)self notebookItemIdentifier];

  if (v13) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasStatus]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBSearchForNotebookItemsIntent *)self hasTaskPriority]) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_temporalEventTriggerTypes.count)
  {
    unint64_t v14 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v14;
    }
    while (v14 < self->_temporalEventTriggerTypes.count);
  }
  uint64_t v15 = [(_INPBSearchForNotebookItemsIntent *)self title];

  if (v15)
  {
    NSUInteger v16 = [(_INPBSearchForNotebookItemsIntent *)self title];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForNotebookItemsIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (void)setTitle:(id)a3
{
}

- (int)StringAsTemporalEventTriggerTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TEMPORAL_TRIGGER_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOT_SCHEDULED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SCHEDULED_NON_RECURRING"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SCHEDULED_RECURRING"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)temporalEventTriggerTypesAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551BE98[a3];
  }

  return v3;
}

- (int)temporalEventTriggerTypeAtIndex:(unint64_t)a3
{
  return self->_temporalEventTriggerTypes.list[a3];
}

- (unint64_t)temporalEventTriggerTypesCount
{
  return self->_temporalEventTriggerTypes.count;
}

- (void)addTemporalEventTriggerType:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearTemporalEventTriggerTypes
{
}

- (int)temporalEventTriggerTypes
{
  return self->_temporalEventTriggerTypes.list;
}

- (void)setTemporalEventTriggerTypes:(int *)a3 count:(unint64_t)a4
{
}

- (int)StringAsTaskPriority:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PRIORITY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOT_FLAGGED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FLAGGED"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)taskPriorityAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551BE80[a3];
  }

  return v3;
}

- (void)setHasTaskPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTaskPriority
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTaskPriority:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xDF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x20;
    self->_int taskPriority = a3;
  }
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_STATUS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOT_COMPLETED"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"COMPLETED"])
  {
    int v4 = 20;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)statusAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 20)
    {
      int v4 = @"COMPLETED";
    }
    else if (a3 == 10)
    {
      int v4 = @"NOT_COMPLETED";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_STATUS";
  }
  return v4;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setStatus:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xEF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x10;
    self->_int status = a3;
  }
}

- (BOOL)hasNotebookItemIdentifier
{
  return self->_notebookItemIdentifier != 0;
}

- (void)setNotebookItemIdentifier:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  notebookItemIdentifier = self->_notebookItemIdentifier;
  self->_notebookItemIdentifier = v4;

  MEMORY[0x1F41817F8](v4, notebookItemIdentifier);
}

- (int)StringAsLocationSearchType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_LOCATION_SEARCH_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BY_LOCATION_TRIGGER"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)locationSearchTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 10)
    {
      int v4 = @"BY_LOCATION_TRIGGER";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_LOCATION_SEARCH_TYPE";
  }
  return v4;
}

- (void)setHasLocationSearchType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLocationSearchType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLocationSearchType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xF7;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 8;
    self->_int locationSearchType = a3;
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (void)setLocation:(id)a3
{
}

- (int)StringAsItemType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_NOTE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NOTE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"TASK_LIST"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"TASK"])
  {
    int v4 = 30;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)itemTypeAsString:(int)a3
{
  if (a3 > 19)
  {
    if (a3 == 20)
    {
      int v4 = @"TASK_LIST";
    }
    else
    {
      if (a3 != 30)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      int v4 = @"TASK";
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 10)
      {
        int v4 = @"NOTE";
        return v4;
      }
      goto LABEL_12;
    }
    int v4 = @"UNKNOWN_NOTE_TYPE";
  }
  return v4;
}

- (void)setHasItemType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasItemType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setItemType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int itemType = a3;
  }
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

- (void)setHasIncludeAllNoteContents:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIncludeAllNoteContents
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIncludeAllNoteContents:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int includeAllNoteContents = a3;
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setGroupName:(id)a3
{
}

- (BOOL)hasDateTime
{
  return self->_dateTime != 0;
}

- (void)setDateTime:(id)a3
{
}

- (int)StringAsDateSearchType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_DATE_SEARCH_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BY_DUE_DATE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BY_MODIFIED_DATE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"BY_CREATED_DATE"])
  {
    int v4 = 30;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)dateSearchTypeAsString:(int)a3
{
  if (a3 > 19)
  {
    if (a3 == 20)
    {
      int v4 = @"BY_MODIFIED_DATE";
    }
    else
    {
      if (a3 != 30)
      {
LABEL_12:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      int v4 = @"BY_CREATED_DATE";
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 10)
      {
        int v4 = @"BY_DUE_DATE";
        return v4;
      }
      goto LABEL_12;
    }
    int v4 = @"UNKNOWN_DATE_SEARCH_TYPE";
  }
  return v4;
}

- (void)setHasDateSearchType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateSearchType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDateSearchType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int dateSearchType = a3;
  }
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)setContent:(id)a3
{
  int v4 = (NSString *)[a3 copy];
  content = self->_content;
  self->_content = v4;

  MEMORY[0x1F41817F8](v4, content);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end