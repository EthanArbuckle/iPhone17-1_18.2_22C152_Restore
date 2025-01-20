@interface MKIncidentExtendedDetailCell
- (MKIncidentDetailDelegate)delegate;
- (MKIncidentExtendedDetailCell)initWithReuseIdentifier:(id)a3;
- (void)configureWithAdvisories:(id)a3 artwork:(id)a4;
- (void)configureWithAdvisoryItem:(id)a3;
- (void)configureWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 image:(id)a6;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
@end

@implementation MKIncidentExtendedDetailCell

- (MKIncidentExtendedDetailCell)initWithReuseIdentifier:(id)a3
{
  v33[4] = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)MKIncidentExtendedDetailCell;
  v3 = [(MKIncidentExtendedDetailCell *)&v32 initWithStyle:0 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(MKIncidentExtendedDetailCell *)v3 contentView];
    [v5 setOpaque:0];

    v6 = [MEMORY[0x1E4F428B8] clearColor];
    [(MKIncidentExtendedDetailCell *)v4 setBackgroundColor:v6];

    [(MKIncidentExtendedDetailCell *)v4 setOpaque:0];
    [(MKIncidentExtendedDetailCell *)v4 setSelectionStyle:0];
    [(MKIncidentExtendedDetailCell *)v4 setAccessibilityIdentifier:@"MKIncidentExtendedDetailCell"];
    v7 = [MEMORY[0x1E4F428B8] clearColor];
    v8 = [(MKIncidentExtendedDetailCell *)v4 contentView];
    [v8 setBackgroundColor:v7];

    v9 = [MKIncidentDetailContentView alloc];
    uint64_t v10 = -[MKIncidentDetailContentView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    incidentContentView = v4->_incidentContentView;
    v4->_incidentContentView = (MKIncidentDetailContentView *)v10;

    [(MKIncidentDetailContentView *)v4->_incidentContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(MKIncidentExtendedDetailCell *)v4 contentView];
    [v12 addSubview:v4->_incidentContentView];

    v24 = (void *)MEMORY[0x1E4F28DC8];
    v30 = [(MKIncidentDetailContentView *)v4->_incidentContentView leadingAnchor];
    v31 = [(MKIncidentExtendedDetailCell *)v4 contentView];
    v29 = [v31 leadingAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v33[0] = v28;
    v26 = [(MKIncidentDetailContentView *)v4->_incidentContentView trailingAnchor];
    v27 = [(MKIncidentExtendedDetailCell *)v4 contentView];
    v25 = [v27 trailingAnchor];
    v23 = [v26 constraintEqualToAnchor:v25];
    v33[1] = v23;
    v13 = [(MKIncidentDetailContentView *)v4->_incidentContentView topAnchor];
    v14 = [(MKIncidentExtendedDetailCell *)v4 contentView];
    v15 = [v14 topAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];
    v33[2] = v16;
    v17 = [(MKIncidentDetailContentView *)v4->_incidentContentView bottomAnchor];
    v18 = [(MKIncidentExtendedDetailCell *)v4 contentView];
    v19 = [v18 bottomAnchor];
    v20 = [v17 constraintEqualToAnchor:v19];
    v33[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    [v24 activateConstraints:v21];
  }
  return v4;
}

- (void)configureWithAdvisories:(id)a3 artwork:(id)a4
{
}

- (void)setDelegate:(id)a3
{
}

- (MKIncidentDetailDelegate)delegate
{
  return [(MKIncidentDetailContentView *)self->_incidentContentView delegate];
}

- (void)configureWithAdvisoryItem:(id)a3
{
}

- (void)configureWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 image:(id)a6
{
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MKIncidentExtendedDetailCell;
  [(MKIncidentExtendedDetailCell *)&v3 prepareForReuse];
  [(MKIncidentDetailContentView *)self->_incidentContentView reset];
}

- (void).cxx_destruct
{
}

@end