@interface _GEOTransitIncident
+ (BOOL)supportsSecureCoding;
- (BOOL)isBlockingIncident;
- (BOOL)isEqual:(id)a3;
- (GEOTransitIconDataSource)artworkDataSource;
- (NSArray)affectedEntities;
- (NSDate)creationDate;
- (NSDate)endDate;
- (NSDate)lastUpdated;
- (NSDate)startDate;
- (NSString)debugDescription;
- (NSString)fullDescription;
- (NSString)messageForNonRoutable;
- (NSString)messageForRoutePlanning;
- (NSString)messageForRouteStepping;
- (NSString)summary;
- (NSString)title;
- (_GEOTransitIncident)initWithCoder:(id)a3;
- (_GEOTransitIncident)initWithIncident:(id)a3;
- (int)iconType;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GEOTransitIncident

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GEOTransitIncident)initWithIncident:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GEOTransitIncident;
  v6 = [(_GEOTransitIncident *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_incident, a3);
  }

  return v7;
}

- (_GEOTransitIncident)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GEOTransitIncident;
  id v5 = [(_GEOTransitIncident *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"incident"];
    incident = v5->_incident;
    v5->_incident = (GEOPBTransitIncident *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  incident = self->_incident;
  if (incident) {
    [a3 encodeObject:incident forKey:@"incident"];
  }
}

- (NSString)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t v6 = [(_GEOTransitIncident *)self muid];
  v7 = [(_GEOTransitIncident *)self title];
  v8 = [(_GEOTransitIncident *)self summary];
  objc_super v9 = [(_GEOTransitIncident *)self fullDescription];
  objc_super v10 = [v3 stringWithFormat:@"<%@ %p: %llu, %@, %@, %@>", v5, self, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (unint64_t)muid
{
  incident = self->_incident;
  if (incident) {
    return incident->_incidentMuid;
  }
  else {
    return 0;
  }
}

- (NSString)title
{
  return -[GEOPBTransitIncident titleString]((id *)&self->_incident->super.super.isa);
}

- (NSString)summary
{
  return -[GEOPBTransitIncident shortDescriptionString]((id *)&self->_incident->super.super.isa);
}

- (NSString)fullDescription
{
  return -[GEOPBTransitIncident longDescriptionString]((id *)&self->_incident->super.super.isa);
}

- (NSString)messageForRoutePlanning
{
  return -[GEOPBTransitIncident messageString]((id *)&self->_incident->super.super.isa);
}

- (NSString)messageForRouteStepping
{
  return -[GEOPBTransitIncident messageForIncidentType]((id *)&self->_incident->super.super.isa);
}

- (NSString)messageForNonRoutable
{
  return -[GEOPBTransitIncident messageForAllBlocking]((id *)&self->_incident->super.super.isa);
}

- (NSDate)startDate
{
  incident = self->_incident;
  if (incident && (*(unsigned char *)&incident->_flags & 0x20) != 0)
  {
    LODWORD(v2) = incident->_startDatetime;
    id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)endDate
{
  incident = self->_incident;
  if (incident && (*(unsigned char *)&incident->_flags & 4) != 0)
  {
    LODWORD(v2) = incident->_endDatetime;
    id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (int)iconType
{
  incident = self->_incident;
  if (incident)
  {
    if ((*(unsigned char *)&incident->_flags & 8) != 0)
    {
      unsigned int v3 = -[GEOPBTransitIncident iconEnum]((os_unfair_lock_s *)incident);
      if (v3 == 1) {
        LODWORD(incident) = 2;
      }
      else {
        LODWORD(incident) = v3 == 0;
      }
    }
    else
    {
      LODWORD(incident) = 0;
    }
  }
  return (int)incident;
}

- (NSDate)creationDate
{
  incident = self->_incident;
  if (incident && (*(unsigned char *)&incident->_flags & 2) != 0)
  {
    LODWORD(v2) = incident->_creationDatetime;
    id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)lastUpdated
{
  incident = self->_incident;
  if (incident && (*(unsigned char *)&incident->_flags & 0x40) != 0)
  {
    LODWORD(v2) = incident->_updatedDatetime;
    id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)v2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (BOOL)isBlockingIncident
{
  incident = self->_incident;
  return incident && incident->_blocking;
}

- (NSArray)affectedEntities
{
  return (NSArray *)-[GEOPBTransitIncident affectedEntitys]((id *)&self->_incident->super.super.isa);
}

- (BOOL)isEqual:(id)a3
{
  id v8 = a3;
  if ([v8 conformsToProtocol:&unk_1ED7E90C8])
  {
    id v9 = v8;
    int v10 = [(_GEOTransitIncident *)self isBlockingIncident];
    if (v10 != [v9 isBlockingIncident]
      || (int v11 = -[_GEOTransitIncident iconType](self, "iconType"), v11 != [v9 iconType]))
    {
      char v13 = 0;
LABEL_80:

      goto LABEL_81;
    }
    v12 = [(_GEOTransitIncident *)self title];
    if (v12 || ([v9 title], (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      unsigned int v3 = [(_GEOTransitIncident *)self title];
      id v4 = [v9 title];
      if (![v3 isEqualToString:v4])
      {
        char v13 = 0;
        goto LABEL_76;
      }
      int v61 = 1;
    }
    else
    {
      int v61 = 0;
    }
    v14 = [(_GEOTransitIncident *)self summary];
    if (v14 || ([v9 summary], (v54 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v15 = [(_GEOTransitIncident *)self summary];
      unint64_t v6 = [v9 summary];
      v60 = v15;
      if (![v15 isEqualToString:v6])
      {
        char v13 = 0;
        goto LABEL_73;
      }
      v59 = v5;
      int v58 = 1;
    }
    else
    {
      v59 = v5;
      v54 = 0;
      int v58 = 0;
    }
    v16 = [(_GEOTransitIncident *)self fullDescription];
    if (v16 || ([v9 fullDescription], (v50 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17 = [(_GEOTransitIncident *)self fullDescription];
      v55 = [v9 fullDescription];
      v56 = v17;
      if (![v17 isEqualToString:v55])
      {
        char v13 = 0;
LABEL_68:

LABEL_69:
        if (!v16) {

        }
        if (!v58)
        {
          id v5 = v59;
          if (v14)
          {
LABEL_75:

            if (!v61)
            {
LABEL_77:
              if (!v12) {

              }
              goto LABEL_80;
            }
LABEL_76:

            goto LABEL_77;
          }
LABEL_74:

          goto LABEL_75;
        }
        id v5 = v59;
LABEL_73:

        if (v14) {
          goto LABEL_75;
        }
        goto LABEL_74;
      }
      int v53 = 1;
    }
    else
    {
      v50 = 0;
      int v53 = 0;
    }
    uint64_t v57 = [(_GEOTransitIncident *)self startDate];
    if (v57 || ([v9 startDate], (v45 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v18 = [(_GEOTransitIncident *)self startDate];
      [v9 startDate];
      v51 = v52 = v18;
      if (![v18 isEqualToDate:v51])
      {
        char v13 = 0;
        goto LABEL_64;
      }
      int v48 = 1;
    }
    else
    {
      v45 = 0;
      int v48 = 0;
    }
    uint64_t v49 = [(_GEOTransitIncident *)self endDate];
    if (v49 || ([v9 endDate], (v40 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v19 = [(_GEOTransitIncident *)self endDate];
      v46 = [v9 endDate];
      v47 = v19;
      if (![v19 isEqualToDate:v46])
      {
        char v13 = 0;
        goto LABEL_60;
      }
      int v43 = 1;
    }
    else
    {
      v40 = 0;
      int v43 = 0;
    }
    uint64_t v44 = [(_GEOTransitIncident *)self creationDate];
    if (v44 || ([v9 creationDate], (v35 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v20 = [(_GEOTransitIncident *)self creationDate];
      v41 = [v9 creationDate];
      v42 = v20;
      if (![v20 isEqualToDate:v41])
      {
        char v13 = 0;
        goto LABEL_56;
      }
      int v38 = 1;
    }
    else
    {
      v35 = 0;
      int v38 = 0;
    }
    uint64_t v39 = [(_GEOTransitIncident *)self lastUpdated];
    if (v39 || ([v9 lastUpdated], (v31 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v21 = [(_GEOTransitIncident *)self lastUpdated];
      v36 = [v9 lastUpdated];
      v37 = v21;
      if (![v21 isEqualToDate:v36])
      {
        char v13 = 0;
        goto LABEL_52;
      }
      int v34 = 1;
    }
    else
    {
      v31 = 0;
      int v34 = 0;
    }
    uint64_t v22 = [(_GEOTransitIncident *)self affectedEntities];
    if (v22 || ([v9 affectedEntities], (uint64_t v30 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v32 = [(_GEOTransitIncident *)self affectedEntities];
      [v9 affectedEntities];
      v23 = v33 = (void *)v22;
      char v13 = objc_msgSend(v32, "isEqualToArray:");

      if (v33)
      {

        if (!v34) {
          goto LABEL_53;
        }
        goto LABEL_52;
      }
      v29 = (void *)v30;
    }
    else
    {
      v29 = 0;
      char v13 = 1;
    }

    if ((v34 & 1) == 0)
    {
LABEL_53:
      v24 = (void *)v39;
      if (!v39)
      {

        v24 = 0;
      }

      if (!v38)
      {
LABEL_57:
        v25 = (void *)v44;
        if (!v44)
        {

          v25 = 0;
        }

        if (!v43)
        {
LABEL_61:
          v26 = (void *)v49;
          if (!v49)
          {

            v26 = 0;
          }

          if (!v48)
          {
LABEL_65:
            v27 = (void *)v57;
            if (!v57)
            {

              v27 = 0;
            }

            if (!v53) {
              goto LABEL_69;
            }
            goto LABEL_68;
          }
LABEL_64:

          goto LABEL_65;
        }
LABEL_60:

        goto LABEL_61;
      }
LABEL_56:

      goto LABEL_57;
    }
LABEL_52:

    goto LABEL_53;
  }
  char v13 = 0;
LABEL_81:

  return v13;
}

- (GEOTransitIconDataSource)artworkDataSource
{
  unint64_t v2 = -[GEOPBTransitIncident incidentTypeArtwork]((id *)&self->_incident->super.super.isa);
  unsigned int v3 = [v2 iconDataSource];

  return (GEOTransitIconDataSource *)v3;
}

- (unint64_t)hash
{
  if ([(_GEOTransitIncident *)self isBlockingIncident]) {
    uint64_t v3 = 2654435761;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = 2654435761 * [(_GEOTransitIncident *)self iconType];
  v23 = [(_GEOTransitIncident *)self title];
  uint64_t v5 = v3 ^ [v23 hash];
  unint64_t v6 = [(_GEOTransitIncident *)self summary];
  uint64_t v7 = v5 ^ [v6 hash];
  id v8 = [(_GEOTransitIncident *)self fullDescription];
  uint64_t v9 = v7 ^ [v8 hash];
  int v10 = [(_GEOTransitIncident *)self startDate];
  uint64_t v11 = v4 ^ v9 ^ [v10 hash];
  v12 = [(_GEOTransitIncident *)self endDate];
  uint64_t v13 = [v12 hash];
  v14 = [(_GEOTransitIncident *)self creationDate];
  uint64_t v15 = v13 ^ [v14 hash];
  v16 = [(_GEOTransitIncident *)self lastUpdated];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(_GEOTransitIncident *)self affectedEntities];
  uint64_t v19 = v17 ^ [v18 hash];
  v20 = [(_GEOTransitIncident *)self artworkDataSource];
  unint64_t v21 = v11 ^ v19 ^ [v20 hash];

  return v21;
}

- (void).cxx_destruct
{
}

@end