@interface _CDCachedPeopleSuggestion
- (BOOL)isValidForContext:(id)a3;
- (BOOL)isValidForContext:(id)a3 settings:(id)a4 timeoutSeconds:(double)a5;
- (BOOL)isValidForSettings:(id)a3;
- (NSArray)suggestions;
- (NSDate)date;
- (_CDPeopleSuggesterContext)context;
- (_CDPeopleSuggesterSettings)settings;
- (void)setContext:(id)a3;
- (void)setDate:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSuggestions:(id)a3;
@end

@implementation _CDCachedPeopleSuggestion

- (BOOL)isValidForContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 locationUUID];
  v6 = [(_CDPeopleSuggesterContext *)self->_context locationUUID];
  if (v5 == v6 || [v5 isEqual:v6])
  {
    v7 = [v4 title];
    v8 = [(_CDPeopleSuggesterContext *)self->_context title];
    if (v7 == v8 || [v7 isEqual:v8])
    {
      v9 = [v4 seedContactIdentifiers];
      v10 = [(_CDPeopleSuggesterContext *)self->_context seedContactIdentifiers];
      if (v9 == v10 || [v9 isEqual:v10])
      {
        uint64_t v35 = [v4 contactPrefix];
        v11 = +[_CDPeopleSuggester restrictedPrefixForPrefix:](_CDPeopleSuggester, "restrictedPrefixForPrefix:");
        v36 = [(_CDPeopleSuggesterContext *)self->_context contactPrefix];
        v12 = +[_CDPeopleSuggester restrictedPrefixForPrefix:](_CDPeopleSuggester, "restrictedPrefixForPrefix:");
        v37 = v11;
        if (v11 == v12 || [v11 isEqual:v12])
        {
          v33 = v9;
          v34 = v12;
          v13 = [v4 consumerIdentifier];
          v14 = [(_CDPeopleSuggesterContext *)self->_context consumerIdentifier];
          if (v13 == v14 || [v13 isEqual:v14])
          {
            v31 = v10;
            v32 = v14;
            v15 = [v4 nearbyPeople];
            v16 = [(_CDPeopleSuggesterContext *)self->_context nearbyPeople];
            v30 = v15;
            if (v15 == v16 || [v15 isEqual:v16])
            {
              v29 = v16;
              uint64_t v17 = [v4 activeInteraction];
              uint64_t v18 = [(_CDPeopleSuggesterContext *)self->_context activeInteraction];
              v19 = (void *)v17;
              v20 = (void *)v18;
              if (v19 == (void *)v18 || (v21 = v19, int v22 = [v19 isEqual:v18], v19 = v21, v22))
              {
                v21 = v19;
                v23 = objc_msgSend(v4, "contentUTIs", v20);
                v24 = [(_CDPeopleSuggesterContext *)self->_context contentUTIs];
                if (v23 == v24) {
                  char v25 = 1;
                }
                else {
                  char v25 = [v23 isEqual:v24];
                }

                v26 = (void *)v35;
                v20 = v28;
              }
              else
              {
                char v25 = 0;
                v26 = (void *)v35;
              }

              v16 = v29;
            }
            else
            {
              char v25 = 0;
              v26 = (void *)v35;
            }

            v10 = v31;
            v14 = v32;
          }
          else
          {
            char v25 = 0;
            v26 = (void *)v35;
          }

          v9 = v33;
          v12 = v34;
        }
        else
        {
          char v25 = 0;
          v26 = (void *)v35;
        }
      }
      else
      {
        char v25 = 0;
      }
    }
    else
    {
      char v25 = 0;
    }
  }
  else
  {
    char v25 = 0;
  }

  return v25;
}

- (BOOL)isValidForSettings:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 maxNumberOfPeopleSuggested];
  if (v5 >= [(_CDPeopleSuggesterSettings *)self->_settings maxNumberOfPeopleSuggested])
  {
    v7 = [v4 constrainAccounts];
    v8 = [(_CDPeopleSuggesterSettings *)self->_settings constrainAccounts];
    if (v7 == v8 || [v7 isEqual:v8])
    {
      v9 = [v4 constrainBundleIds];
      v10 = [(_CDPeopleSuggesterSettings *)self->_settings constrainBundleIds];
      if (v9 == v10 || [v9 isEqual:v10])
      {
        v11 = [v4 constrainDomainIdentifiers];
        v12 = [(_CDPeopleSuggesterSettings *)self->_settings constrainDomainIdentifiers];
        if (v11 == v12 || [v11 isEqual:v12])
        {
          v13 = [v4 constrainMechanisms];
          v14 = [(_CDPeopleSuggesterSettings *)self->_settings constrainMechanisms];
          if (v13 == v14 || [v13 isEqual:v14])
          {
            v37 = v11;
            v38 = v14;
            v15 = [v4 constrainIdentifiers];
            v16 = [(_CDPeopleSuggesterSettings *)self->_settings constrainIdentifiers];
            if (v15 == v16 || [v15 isEqual:v16])
            {
              uint64_t v35 = v12;
              v36 = v16;
              uint64_t v17 = [v4 constrainPersonIds];
              uint64_t v18 = [(_CDPeopleSuggesterSettings *)self->_settings constrainPersonIds];
              if (v17 == v18 || [v17 isEqual:v18])
              {
                v33 = v9;
                v34 = v18;
                v19 = [v4 constrainPersonIdType];
                v20 = [(_CDPeopleSuggesterSettings *)self->_settings constrainPersonIdType];
                if (v19 == v20 || [v19 isEqual:v20])
                {
                  v31 = v13;
                  v32 = v20;
                  int v21 = [v4 useTitleToContrainKeywords];
                  if (v21 == [(_CDPeopleSuggesterSettings *)self->_settings useTitleToContrainKeywords])
                  {
                    int v22 = [v4 ignoreContactIdentifiers];
                    v23 = [(_CDPeopleSuggesterSettings *)self->_settings ignoreContactIdentifiers];
                    v30 = v22;
                    if ((v22 == v23 || [v22 isEqual:v23])
                      && (int v24 = [v4 useFuture],
                          v24 == [(_CDPeopleSuggesterSettings *)self->_settings useFuture])
                      && (int v25 = [v4 aggregateByIdentifier],
                          v25 == -[_CDPeopleSuggesterSettings aggregateByIdentifier](self->_settings, "aggregateByIdentifier"))&& (int v26 = [v4 requireOutgoingInteraction], v26 == -[_CDPeopleSuggesterSettings requireOutgoingInteraction](self->_settings, "requireOutgoingInteraction"))&& (v27 = objc_msgSend(v4, "constrainMaxRecipientCount"), v27 == -[_CDPeopleSuggesterSettings constrainMaxRecipientCount](self->_settings, "constrainMaxRecipientCount")))
                    {
                      int v28 = [v4 inferActiveInteractions];
                      int v6 = v28 ^ [(_CDPeopleSuggesterSettings *)self->_settings inferActiveInteractions] ^ 1;
                    }
                    else
                    {
                      LOBYTE(v6) = 0;
                    }
                    v13 = v31;
                  }
                  else
                  {
                    LOBYTE(v6) = 0;
                    v13 = v31;
                  }
                  v20 = v32;
                }
                else
                {
                  LOBYTE(v6) = 0;
                }

                v9 = v33;
                uint64_t v18 = v34;
              }
              else
              {
                LOBYTE(v6) = 0;
              }

              v12 = v35;
              v16 = v36;
            }
            else
            {
              LOBYTE(v6) = 0;
            }

            v11 = v37;
            v14 = v38;
          }
          else
          {
            LOBYTE(v6) = 0;
          }
        }
        else
        {
          LOBYTE(v6) = 0;
        }
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isValidForContext:(id)a3 settings:(id)a4 timeoutSeconds:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F1C9C8] date];
  v11 = [(_CDCachedPeopleSuggestion *)self date];
  [v10 timeIntervalSinceDate:v11];
  double v13 = fabs(v12);

  if (v13 >= a5)
  {
    v15 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[_CDCachedPeopleSuggestion isValidForContext:settings:timeoutSeconds:](v15, a5);
    }

    goto LABEL_7;
  }
  if (![(_CDCachedPeopleSuggestion *)self isValidForContext:v8])
  {
LABEL_7:
    BOOL v14 = 0;
    goto LABEL_8;
  }
  BOOL v14 = [(_CDCachedPeopleSuggestion *)self isValidForSettings:v9];
LABEL_8:

  return v14;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDate:(id)a3
{
}

- (_CDPeopleSuggesterContext)context
{
  return (_CDPeopleSuggesterContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContext:(id)a3
{
}

- (_CDPeopleSuggesterSettings)settings
{
  return (_CDPeopleSuggesterSettings *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSettings:(id)a3
{
}

- (NSArray)suggestions
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (void)isValidForContext:(os_log_t)log settings:(double)a2 timeoutSeconds:.cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "_CDPeopleSuggester: cache timeout. diff > %f sec", (uint8_t *)&v2, 0xCu);
}

@end