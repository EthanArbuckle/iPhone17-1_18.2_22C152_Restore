@interface MPVoicemailMessageViewModel
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVoicemailMessageViewModel:(id)a3;
- (BOOL)isRead;
- (BOOL)showsPlayerControls;
- (BOOL)showsRestrictedAlertView;
- (BOOL)showsTranscriptionView;
- (NSAttributedString)localizedAttributedRestrictedAlertTitle;
- (NSDate)date;
- (NSString)localizedDate;
- (NSString)localizedDuration;
- (NSString)localizedSenderIdentityTitle;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)localizedTranscriptionMessage;
- (VMMessageTranscriptViewModel)transcriptViewModel;
- (double)duration;
- (unint64_t)hash;
- (void)setDate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setIsDeleted:(BOOL)a3;
- (void)setIsRead:(BOOL)a3;
- (void)setLocalizedAttributedRestrictedAlertTitle:(id)a3;
- (void)setLocalizedDate:(id)a3;
- (void)setLocalizedDuration:(id)a3;
- (void)setLocalizedSenderIdentityTitle:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setLocalizedTranscriptionMessage:(id)a3;
- (void)setShowsPlayerControls:(BOOL)a3;
- (void)setShowsRestrictedAlertView:(BOOL)a3;
- (void)setShowsTranscriptionView:(BOOL)a3;
- (void)setTranscriptViewModel:(id)a3;
@end

@implementation MPVoicemailMessageViewModel

- (BOOL)isEqual:(id)a3
{
  v4 = (MPVoicemailMessageViewModel *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(MPVoicemailMessageViewModel *)self isEqualToVoicemailMessageViewModel:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToVoicemailMessageViewModel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MPVoicemailMessageViewModel *)self date];
  v6 = [v4 date];
  if ([v5 isEqualToDate:v6])
  {
    v7 = [(MPVoicemailMessageViewModel *)self localizedDate];
    v8 = [v4 localizedDate];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(MPVoicemailMessageViewModel *)self localizedDuration];
      v10 = [v4 localizedDuration];
      if ([v9 isEqualToString:v10])
      {
        v11 = [(MPVoicemailMessageViewModel *)self localizedTitle];
        v12 = [v4 localizedTitle];
        if ([v11 isEqualToString:v12])
        {
          v36 = v11;
          v13 = [(MPVoicemailMessageViewModel *)self localizedSubtitle];
          v37 = [v4 localizedSubtitle];
          v38 = v13;
          if (objc_msgSend(v13, "isEqualToString:"))
          {
            v14 = [(MPVoicemailMessageViewModel *)self localizedTranscriptionMessage];
            v34 = [v4 localizedTranscriptionMessage];
            v35 = v14;
            if (objc_msgSend(v14, "isEqualToString:"))
            {
              v15 = [(MPVoicemailMessageViewModel *)self localizedSenderIdentityTitle];
              v32 = [v4 localizedSenderIdentityTitle];
              v33 = v15;
              if (objc_msgSend(v15, "isEqualToString:"))
              {
                v16 = [(MPVoicemailMessageViewModel *)self localizedAttributedRestrictedAlertTitle];
                v30 = [v4 localizedAttributedRestrictedAlertTitle];
                v31 = v16;
                unsigned int v17 = [v16 isEqualToAttributedString:];
                v11 = v36;
                if (!v17) {
                  goto LABEL_15;
                }
                [(MPVoicemailMessageViewModel *)self duration];
                double v19 = v18;
                [v4 duration];
                if (v19 != v20) {
                  goto LABEL_15;
                }
                unsigned int v24 = [(MPVoicemailMessageViewModel *)self showsPlayerControls];
                if (v24 == [v4 showsPlayerControls]
                  && (unsigned int v25 = [(MPVoicemailMessageViewModel *)self showsRestrictedAlertView],
                      v25 == [v4 showsRestrictedAlertView])
                  && (unsigned int v26 = [(MPVoicemailMessageViewModel *)self showsTranscriptionView],
                      v26 == [v4 showsTranscriptionView])
                  && (unsigned int v27 = [(MPVoicemailMessageViewModel *)self isRead],
                      v27 == [v4 isRead])
                  && (unsigned int v28 = [(MPVoicemailMessageViewModel *)self isDeleted],
                      v28 == [v4 isDeleted]))
                {
                  v29 = [(MPVoicemailMessageViewModel *)self transcriptViewModel];
                  v23 = [v4 transcriptViewModel];
                  BOOL v21 = v29 == v23;
                }
                else
                {
LABEL_15:
                  BOOL v21 = 0;
                }
              }
              else
              {
                BOOL v21 = 0;
                v11 = v36;
              }
            }
            else
            {
              BOOL v21 = 0;
              v11 = v36;
            }
          }
          else
          {
            BOOL v21 = 0;
            v11 = v36;
          }
        }
        else
        {
          BOOL v21 = 0;
        }
      }
      else
      {
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  v36 = [(MPVoicemailMessageViewModel *)self date];
  unint64_t v31 = (unint64_t)[v36 hash];
  v35 = [(MPVoicemailMessageViewModel *)self localizedDate];
  unint64_t v30 = (unint64_t)[v35 hash];
  v34 = [(MPVoicemailMessageViewModel *)self localizedDuration];
  unint64_t v29 = (unint64_t)[v34 hash];
  v33 = [(MPVoicemailMessageViewModel *)self localizedTitle];
  unint64_t v28 = (unint64_t)[v33 hash];
  v32 = [(MPVoicemailMessageViewModel *)self localizedSubtitle];
  unint64_t v27 = (unint64_t)[v32 hash];
  v3 = [(MPVoicemailMessageViewModel *)self localizedTranscriptionMessage];
  unint64_t v26 = (unint64_t)[v3 hash];
  id v4 = [(MPVoicemailMessageViewModel *)self localizedSenderIdentityTitle];
  unint64_t v25 = (unint64_t)[v4 hash];
  BOOL v5 = [(MPVoicemailMessageViewModel *)self localizedAttributedRestrictedAlertTitle];
  unint64_t v24 = (unint64_t)[v5 hash];
  [(MPVoicemailMessageViewModel *)self duration];
  double v7 = -v6;
  if (v6 >= 0.0) {
    double v7 = v6;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  double v10 = fmod(v8, 1.84467441e19);
  unint64_t v11 = 2654435761u * (unint64_t)v10;
  unint64_t v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0) {
    unint64_t v12 = 2654435761u * (unint64_t)v10;
  }
  unint64_t v13 = v11 - (unint64_t)fabs(v9);
  if (v9 < 0.0) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = v12;
  }
  if ([(MPVoicemailMessageViewModel *)self showsPlayerControls])
  {
    if ([(MPVoicemailMessageViewModel *)self showsPlayerControls]) {
      uint64_t v15 = 2654435761;
    }
    else {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  if ([(MPVoicemailMessageViewModel *)self showsRestrictedAlertView])
  {
    if ([(MPVoicemailMessageViewModel *)self showsRestrictedAlertView]) {
      uint64_t v16 = 2654435761;
    }
    else {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  if ([(MPVoicemailMessageViewModel *)self showsTranscriptionView])
  {
    if ([(MPVoicemailMessageViewModel *)self showsTranscriptionView]) {
      uint64_t v17 = 2654435761;
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  if ([(MPVoicemailMessageViewModel *)self isRead])
  {
    if ([(MPVoicemailMessageViewModel *)self isRead]) {
      uint64_t v18 = 2654435761;
    }
    else {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  if ([(MPVoicemailMessageViewModel *)self isDeleted])
  {
    if ([(MPVoicemailMessageViewModel *)self isDeleted]) {
      uint64_t v19 = 2654435761;
    }
    else {
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  unint64_t v20 = v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  BOOL v21 = [(MPVoicemailMessageViewModel *)self transcriptViewModel];
  unint64_t v22 = v20 ^ (unint64_t)[v21 hash] ^ v24 ^ v14;

  return v22;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)localizedDate
{
  return self->_localizedDate;
}

- (void)setLocalizedDate:(id)a3
{
}

- (NSString)localizedDuration
{
  return self->_localizedDuration;
}

- (void)setLocalizedDuration:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
}

- (NSString)localizedTranscriptionMessage
{
  return self->_localizedTranscriptionMessage;
}

- (void)setLocalizedTranscriptionMessage:(id)a3
{
}

- (NSString)localizedSenderIdentityTitle
{
  return self->_localizedSenderIdentityTitle;
}

- (void)setLocalizedSenderIdentityTitle:(id)a3
{
}

- (NSAttributedString)localizedAttributedRestrictedAlertTitle
{
  return self->_localizedAttributedRestrictedAlertTitle;
}

- (void)setLocalizedAttributedRestrictedAlertTitle:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)showsPlayerControls
{
  return self->_showsPlayerControls;
}

- (void)setShowsPlayerControls:(BOOL)a3
{
  self->_showsPlayerControls = a3;
}

- (BOOL)showsTranscriptionView
{
  return self->_showsTranscriptionView;
}

- (void)setShowsTranscriptionView:(BOOL)a3
{
  self->_showsTranscriptionView = a3;
}

- (BOOL)showsRestrictedAlertView
{
  return self->_showsRestrictedAlertView;
}

- (void)setShowsRestrictedAlertView:(BOOL)a3
{
  self->_showsRestrictedAlertView = a3;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (void)setIsRead:(BOOL)a3
{
  self->_isRead = a3;
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (void)setIsDeleted:(BOOL)a3
{
  self->_isDeleted = a3;
}

- (VMMessageTranscriptViewModel)transcriptViewModel
{
  return self->_transcriptViewModel;
}

- (void)setTranscriptViewModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptViewModel, 0);
  objc_storeStrong((id *)&self->_localizedAttributedRestrictedAlertTitle, 0);
  objc_storeStrong((id *)&self->_localizedSenderIdentityTitle, 0);
  objc_storeStrong((id *)&self->_localizedTranscriptionMessage, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedDuration, 0);
  objc_storeStrong((id *)&self->_localizedDate, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end