@interface GEODirectionsError
+ (BOOL)supportsSecureCoding;
+ (NSString)key;
- (BOOL)_errorCode:(int64_t)a3 toProblem:(int *)a4;
- (BOOL)hasError:(int64_t)a3;
- (GEODirectionsError)initWithCoder:(id)a3;
- (GEODirectionsError)initWithResponse:(id)a3;
- (GEODirectionsError)initWithSingleProblemType:(int)a3;
- (GEODirectionsError)initWithWaypointIndex:(unint64_t)a3;
- (GEOProblemDetail)problemDetailAtIndex:(unint64_t)a3;
- (GEOServerFormattedString)content;
- (GEOServerFormattedString)title;
- (GEOTransitRoutingIncidentMessage)incidentMessage;
- (NSArray)internalServerErrors;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (id)description;
- (int64_t)_errorCodeForProblemDetail:(GEOProblemDetail)a3;
- (int64_t)firstDirectionsErrorCode;
- (unint64_t)problemDetailsCount;
- (void)_copyProblemDetails:(GEOProblemDetail *)a3 count:(unint64_t)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEODirectionsError

+ (NSString)key
{
  return (NSString *)@"DirectionsError";
}

- (BOOL)_errorCode:(int64_t)a3 toProblem:(int *)a4
{
  int64_t v4 = a3 - 4;
  if ((unint64_t)(a3 - 4) > 0x12 || ((0x7CFFFu >> v4) & 1) == 0) {
    return 0;
  }
  *a4 = dword_18A62D0B8[v4];
  return 1;
}

- (int64_t)_errorCodeForProblemDetail:(GEOProblemDetail)a3
{
  if ((*(unsigned char *)&a3.var2 & 1) == 0) {
    return 1;
  }
  uint64_t v4 = *(void *)&a3.var0;
  int64_t result = 13;
  switch(a3.var0)
  {
    case 1:
      if (a3.var1)
      {
        if (a3.var1 != 1) {
          goto LABEL_18;
        }
        int64_t result = 5;
      }
      else
      {
        int64_t result = 4;
      }
      break;
    case 2:
      if (a3.var1)
      {
        if (a3.var1 != 1) {
          goto LABEL_18;
        }
        int64_t result = 7;
      }
      else
      {
        int64_t result = 6;
      }
      break;
    case 3:
      int64_t result = 8;
      if ((*(unsigned char *)&a3.var2 & 2) != 0 && a3.var1)
      {
        if (a3.var1 != 1) {
          goto LABEL_18;
        }
        int64_t result = 9;
      }
      break;
    case 4:
      if (a3.var1)
      {
        if (a3.var1 != 1)
        {
LABEL_18:
          v5 = NSStringFromSelector(a2);
          NSLog(&cfstr_UnexpectedWayp.isa, v5);
          goto LABEL_34;
        }
        int64_t result = 11;
      }
      else
      {
        int64_t result = 10;
      }
      break;
    case 9:
      return result;
    case 0xA:
      int64_t result = 14;
      break;
    case 0xD:
      int64_t result = 16;
      break;
    case 0xE:
      int64_t result = 18;
      break;
    case 0xF:
      int64_t result = 19;
      break;
    case 0x10:
      int64_t result = 20;
      break;
    case 0x11:
      int64_t result = 21;
      break;
    case 0x13:
      int64_t result = 22;
      break;
    default:
      v5 = NSStringFromSelector(a2);
      int v6 = v4 - 5;
      if (v4 - 5) < 0x12 && ((0x3A0C9u >> v6))
      {
        v7 = off_1E53DA048[v6];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      NSLog(&cfstr_UnexpectedProb.isa, v5, v7);

LABEL_34:
      return 1;
  }
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  if (self->_problemDetailsCount)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      $7D24B5AD5894795FD85A0EE1D817D743 v32 = 0;
      uint64_t v31 = 0;
      v7 = &self->_problemDetails[v5];
      $7D24B5AD5894795FD85A0EE1D817D743 var2 = v7->var2;
      uint64_t v31 = *(void *)&v7->var0;
      $7D24B5AD5894795FD85A0EE1D817D743 v32 = var2;
      v9 = GEOProblemDetailDescription((unsigned int *)&v31);
      [v4 addObject:v9];

      ++v6;
      ++v5;
    }
    while (v6 < self->_problemDetailsCount);
  }
  v10 = NSString;
  v11 = [v4 componentsJoinedByString:@", "];
  v12 = [v10 stringWithFormat:@"GEODirectionsError of type(s): %@", v11];
  [v3 addObject:v12];

  v13 = [GEOComposedString alloc];
  v14 = -[GEOAlert formattedTitle]((id *)&self->_alert->super.super.isa);
  v15 = [(GEOComposedString *)v13 initWithGeoFormattedString:v14];

  v16 = NSString;
  uint64_t v17 = [(GEOComposedString *)v15 stringWithDefaultOptions];
  v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = &stru_1ED51F370;
  }
  v20 = [v16 stringWithFormat:@"Title: %@", v19];
  [v3 addObject:v20];

  v21 = [GEOComposedString alloc];
  v22 = -[GEOAlert formattedContent]((id *)&self->_alert->super.super.isa);
  v23 = [(GEOComposedString *)v21 initWithGeoFormattedString:v22];

  v24 = NSString;
  uint64_t v25 = [(GEOComposedString *)v23 stringWithDefaultOptions];
  v26 = (void *)v25;
  if (v25) {
    v27 = (__CFString *)v25;
  }
  else {
    v27 = &stru_1ED51F370;
  }
  v28 = [v24 stringWithFormat:@"Content: %@", v27];
  [v3 addObject:v28];

  v29 = [v3 componentsJoinedByString:@"\n"];

  return v29;
}

- (GEOProblemDetail)problemDetailAtIndex:(unint64_t)a3
{
  if (self->_problemDetailsCount <= a3)
  {
    $7D24B5AD5894795FD85A0EE1D817D743 var2 = 0;
    uint64_t v4 = 0;
  }
  else
  {
    v3 = &self->_problemDetails[a3];
    uint64_t v4 = *(void *)&v3->var0;
    $7D24B5AD5894795FD85A0EE1D817D743 var2 = v3->var2;
  }
  result.var0 = v4;
  result.var1 = HIDWORD(v4);
  result.$7D24B5AD5894795FD85A0EE1D817D743 var2 = var2;
  return result;
}

- (GEODirectionsError)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)GEODirectionsError;
  uint64_t v5 = [(GEODirectionsError *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_alert"];
    alert = v5->_alert;
    v5->_alert = (GEOAlert *)v6;

    v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"problemDetails"];
    v5->_problemDetails = (GEOProblemDetail *)malloc_type_calloc([v8 count], 0xCuLL, 0x1000040CADD4576uLL);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:*(void *)(*((void *)&v24 + 1) + 8 * v13)];
          int v23 = 0;
          uint64_t v22 = 0;
          if (GEOProblemDetailReadAllFrom((uint64_t)&v22, (uint64_t)v14))
          {
            uint64_t v15 = (uint64_t)&v5->_problemDetails[v5->_problemDetailsCount];
            *(void *)uint64_t v15 = v22;
            *(_DWORD *)(v15 + 8) = v23;
            ++v5->_problemDetailsCount;
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v11);
    }

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routingIncidentMessage"];
    routingIncidentMessage = v5->_routingIncidentMessage;
    v5->_routingIncidentMessage = (GEOTransitRoutingIncidentMessage *)v16;

    uint64_t v18 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_internalServerErrors"];
    internalServerErrors = v5->_internalServerErrors;
    v5->_internalServerErrors = (NSArray *)v18;

    v20 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalServerErrors, 0);
  objc_storeStrong((id *)&self->_routingIncidentMessage, 0);

  objc_storeStrong((id *)&self->_alert, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeObject:self->_alert forKey:@"_alert"];
  if (self->_problemDetailsCount)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_problemDetailsCount)
    {
      uint64_t v5 = 0;
      unint64_t v6 = 0;
      do
      {
        v7 = &self->_problemDetails[v5];
        uint64_t v11 = *(void *)&v7->var0;
        $7D24B5AD5894795FD85A0EE1D817D743 var2 = v7->var2;
        id v8 = objc_alloc_init(MEMORY[0x1E4F94098]);
        GEOProblemDetailWriteTo((uint64_t)&v11);
        id v9 = [v8 data];
        if (v9) {
          [v4 addObject:v9];
        }

        ++v6;
        ++v5;
      }
      while (v6 < self->_problemDetailsCount);
    }
    [v10 encodeObject:v4 forKey:@"problemDetails"];
  }
  [v10 encodeObject:self->_routingIncidentMessage forKey:@"_routingIncidentMessage"];
  [v10 encodeObject:self->_internalServerErrors forKey:@"_internalServerErrors"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_copyProblemDetails:(GEOProblemDetail *)a3 count:(unint64_t)a4
{
  problemDetails = self->_problemDetails;
  if (problemDetails)
  {
    free(problemDetails);
    self->_problemDetails = 0;
  }
  if (a4)
  {
    id v8 = (GEOProblemDetail *)malloc_type_malloc(12 * a4, 0xF0206FF9uLL);
    self->_problemDetails = v8;
    memcpy(v8, a3, 12 * a4);
  }
  self->_problemDetailsCount = a4;
}

- (GEODirectionsError)initWithResponse:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEODirectionsError;
  uint64_t v5 = [(GEODirectionsError *)&v18 init];
  if (v5)
  {
    -[GEODirectionsError _copyProblemDetails:count:](v5, "_copyProblemDetails:count:", [v4 problemDetails], objc_msgSend(v4, "problemDetailsCount"));
    unint64_t v6 = [v4 failureAlert];
    uint64_t v7 = [v6 copy];
    alert = v5->_alert;
    v5->_alert = (GEOAlert *)v7;

    id v9 = [_GEOTransitRoutingIncidentMessage alloc];
    id v10 = [v4 transitIncidentMessage];
    uint64_t v11 = [v4 decoderData];
    uint64_t v12 = [(_GEOTransitRoutingIncidentMessage *)v9 initWithIncidentMessage:v10 decoderData:v11];
    routingIncidentMessage = v5->_routingIncidentMessage;
    v5->_routingIncidentMessage = (GEOTransitRoutingIncidentMessage *)v12;

    v14 = [v4 internalErrors];
    uint64_t v15 = [v14 copy];
    internalServerErrors = v5->_internalServerErrors;
    v5->_internalServerErrors = (NSArray *)v15;
  }
  return v5;
}

- (GEODirectionsError)initWithSingleProblemType:(int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GEODirectionsError;
  id v4 = [(GEODirectionsError *)&v10 init];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v9 = 0;
    int v8 = a3;
    [(GEODirectionsError *)v4 _copyProblemDetails:&v8 count:1];
    unint64_t v6 = v5;
  }

  return v5;
}

- (GEODirectionsError)initWithWaypointIndex:(unint64_t)a3
{
  int v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEODirectionsError;
  id v4 = [(GEODirectionsError *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v7[1] = v3;
    v7[2] = 3;
    v7[0] = 1;
    [(GEODirectionsError *)v4 _copyProblemDetails:v7 count:1];
  }
  return v5;
}

- (void)dealloc
{
  problemDetails = self->_problemDetails;
  if (problemDetails) {
    free(problemDetails);
  }
  v4.receiver = self;
  v4.super_class = (Class)GEODirectionsError;
  [(GEODirectionsError *)&v4 dealloc];
}

- (GEOServerFormattedString)title
{
  return (GEOServerFormattedString *)-[GEOAlert formattedTitle]((id *)&self->_alert->super.super.isa);
}

- (GEOServerFormattedString)content
{
  return (GEOServerFormattedString *)-[GEOAlert formattedContent]((id *)&self->_alert->super.super.isa);
}

- (NSString)localizedTitle
{
  return -[GEOAlert title]((id *)&self->_alert->super.super.isa);
}

- (NSString)localizedDescription
{
  return -[GEOAlert content]((id *)&self->_alert->super.super.isa);
}

- (GEOTransitRoutingIncidentMessage)incidentMessage
{
  return self->_routingIncidentMessage;
}

- (int64_t)firstDirectionsErrorCode
{
  if (self->_problemDetailsCount) {
    return -[GEODirectionsError _errorCodeForProblemDetail:](self, "_errorCodeForProblemDetail:", *(void *)self->_problemDetails, *(_DWORD *)&self->_problemDetails->var2);
  }
  else {
    return 0;
  }
}

- (BOOL)hasError:(int64_t)a3
{
  int v10 = 0;
  BOOL v4 = [(GEODirectionsError *)self _errorCode:a3 toProblem:&v10];
  BOOL result = 0;
  if (v4)
  {
    unint64_t problemDetailsCount = self->_problemDetailsCount;
    if (problemDetailsCount)
    {
      unint64_t v7 = problemDetailsCount - 1;
      p_$7D24B5AD5894795FD85A0EE1D817D743 var2 = &self->_problemDetails->var2;
      do
      {
        unint64_t v9 = v7;
        BOOL result = *(unsigned char *)p_var2 & (*(_DWORD *)&p_var2[-2] == v10);
        if (result) {
          break;
        }
        --v7;
        p_var2 += 3;
      }
      while (v9);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (NSArray)internalServerErrors
{
  return self->_internalServerErrors;
}

- (unint64_t)problemDetailsCount
{
  return self->_problemDetailsCount;
}

@end